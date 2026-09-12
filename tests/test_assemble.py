import hashlib
import json
from pathlib import Path
import sys
import tempfile
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'scripts'))
from assemble import assemble


class AssemblyTests(unittest.TestCase):
    def fragment(self, root, system):
        directory = root / system
        (directory / 'artifacts').mkdir(parents=True)
        (directory / 'receipts').mkdir()
        receipt = b'assembly receipt fixture'
        digest = hashlib.sha256(receipt).hexdigest()
        (directory / 'receipts' / (digest + '.json')).write_bytes(receipt)
        catalog = {'packages': {'example': {'name': 'example', 'versions': {'1': {'systems': ['aarch64-linux', 'x86_64-linux']}}}}}
        artifact = {'receipt_sha256': digest, 'package': {'source': {'Url': {'url': 'https://example.org/archive', 'sha256': 'a' * 64}}}}
        index = {'schema': 1, 'catalog': catalog, 'catalog_sha256': 'catalog', 'artifacts': {'example@1': {system: artifact}}}
        (directory / 'index.json').write_text(json.dumps(index))
        return directory

    def test_complete_platforms_and_retained_receipts(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            for system in ['aarch64-linux', 'x86_64-linux']:
                self.fragment(root / 'inputs', system)
            assemble(root / 'inputs', root / 'output')
            index = json.loads((root / 'output/index.json').read_bytes())
            self.assertEqual(len(index['artifacts']['example@1']), 2)
            self.assertEqual(len(list((root / 'output/receipts').iterdir())), 1)

    def test_missing_platform_and_tampered_receipt_fail(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            directory = self.fragment(root / 'inputs', 'aarch64-linux')
            with self.assertRaisesRegex(ValueError, 'incomplete'):
                assemble(root / 'inputs', root / 'missing')
            next((directory / 'receipts').iterdir()).write_text('tampered')
            with self.assertRaisesRegex(ValueError, 'digest mismatch'):
                assemble(root / 'inputs', root / 'tampered')


if __name__ == '__main__':
    unittest.main()
