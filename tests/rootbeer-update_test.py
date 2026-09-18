import importlib.util
from pathlib import Path
import unittest
import json
import os
import shutil
import subprocess
import tempfile

spec = importlib.util.spec_from_file_location('rootbeer_update', Path(__file__).resolve().parents[1] / '.github/scripts/rootbeer-update.py')
updates = importlib.util.module_from_spec(spec)
spec.loader.exec_module(updates)


class RecipeTests(unittest.TestCase):
    source = '''return {
    default_version = "0.1.0-main+aaaaaaaaaaaa",
    inputs = { source = { url = "old" } },
    versions = {
        ["0.1.0-main+aaaaaaaaaaaa"] = { inputs = { source = { sha256 = "old" } } },
    },
}'''

    def test_update_preserves_old_inputs_and_is_idempotent(self):
        args = ('b' * 40, '0.1.0', 'c' * 64, '2026-09-18T12:00:00Z', {'backend': 'rust', 'rust': {'packages': ['tool'], 'environment': {'KEEP': 'value'}}})
        result = updates.update_recipe(self.source, *args)
        self.assertIn('default_version = "0.1.0-main+bbbbbbbbbbbb"', result)
        self.assertIn(self.source.split('versions = {')[1], result)
        self.assertIn('inputs = { source = { url = "old" } }', result)
        self.assertIn('["RB_BUILD_TIMESTAMP"] = "2026-09-18 12:00 UTC"', result)
        self.assertIn('["KEEP"] = "value"', result)
        self.assertIn('["packages"] = { "tool" }', result)
        self.assertEqual(result, updates.update_recipe(result, *args))

    def test_rejects_invalid_identity(self):
        with self.assertRaises(ValueError):
            updates.update_recipe(self.source, '../bad', '0.1.0', 'c' * 64, '', {})

    def test_rejects_rollback_to_retained_version(self):
        source = self.source.replace('versions = {', 'versions = { ["0.1.0-main+bbbbbbbbbbbb"] = {},')
        with self.assertRaises(ValueError):
            updates.update_recipe(source, 'b' * 40, '0.1.0', 'c' * 64, '2026-09-18T12:00:00Z', {'backend': 'rust', 'rust': {'packages': ['tool'], 'environment': {'KEEP': 'value'}}})

    @unittest.skipUnless(os.environ.get('ROOTBEER_FORGE'), 'set ROOTBEER_FORGE for catalog regression')
    def test_expanded_catalog_preserves_all_retained_inputs(self):
        engine = str(Path(os.environ['ROOTBEER_FORGE']).resolve())
        packages = Path(__file__).resolve().parents[1] / 'packages'
        before = json.loads(subprocess.check_output([engine, '--catalog', str(packages), 'index']))
        package = before['packages']['rootbeer']
        resolved = package['versions'][package['default_version']]['build']
        build = {key: value for key, value in resolved.items()
                 if key in {'backend', 'rust', 'configure', 'args', 'dependencies', 'steps'}}
        with tempfile.TemporaryDirectory() as directory:
            shutil.copytree(packages, directory, dirs_exist_ok=True)
            recipe = Path(directory) / 'rootbeer.lua'
            recipe.write_text(updates.update_recipe(recipe.read_text(), 'f' * 40, '99.0.0',
                              'c' * 64, '2026-09-18T12:00:00Z', build))
            after = json.loads(subprocess.check_output([engine, '--catalog', directory, 'index']))
        updated = after['packages']['rootbeer']
        for version, retained in package['versions'].items():
            self.assertEqual(retained, updated['versions'][version])
        new = updated['versions'].pop(updated['default_version'])
        updated['default_version'] = package['default_version']
        self.assertEqual(before, after)
        new['build']['rust']['environment']['RB_BUILD_TIMESTAMP'] = resolved['rust']['environment']['RB_BUILD_TIMESTAMP']
        self.assertEqual(resolved['rust'], new['build']['rust'])


if __name__ == '__main__':
    unittest.main()
