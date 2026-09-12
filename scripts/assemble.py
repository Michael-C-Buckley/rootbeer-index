"""Combine verified platform outputs; reject missing coverage and conflicting content."""
import argparse
import hashlib
import json
from pathlib import Path
import shutil
import subprocess


def assemble(inputs, output):
    fragments = sorted(inputs.glob('*/index.json'))
    if not fragments:
        raise ValueError('no platform indexes')
    output.mkdir()
    index = None
    for path in fragments:
        fragment = json.loads(path.read_bytes())
        if index is None:
            index = {**fragment, 'artifacts': {}}
        if fragment['catalog_sha256'] != index['catalog_sha256'] or fragment['catalog'] != index['catalog']:
            raise ValueError('platforms used different recipe snapshots')
        for key, systems in fragment['artifacts'].items():
            for system, artifact in systems.items():
                if system in index['artifacts'].setdefault(key, {}):
                    raise ValueError('duplicate platform artifact: ' + key + ' ' + system)
                index['artifacts'][key][system] = artifact
        for folder in ('artifacts', 'receipts'):
            (output / folder).mkdir(exist_ok=True)
            for file in (path.parent / folder).iterdir():
                if file.is_symlink() or not file.is_file():
                    raise ValueError('unexpected artifact file')
                digest = hashlib.sha256(file.read_bytes()).hexdigest()
                suffix = '.tar.gz' if folder == 'artifacts' else '.json'
                if file.name != digest + suffix:
                    raise ValueError('artifact digest mismatch: ' + file.name)
                target = output / folder / file.name
                if target.exists() and target.read_bytes() != file.read_bytes():
                    raise ValueError('conflicting artifact bytes')
                shutil.copyfile(file, target)
    for entry in index['catalog']['packages'].values():
        for version, recipe in entry['versions'].items():
            key = entry['name'] + '@' + version
            if set(index['artifacts'].get(key, {})) != set(recipe['systems']):
                raise ValueError('incomplete platform coverage: ' + key)
            for artifact in index['artifacts'][key].values():
                receipt = output / 'receipts' / (artifact['receipt_sha256'] + '.json')
                if not receipt.is_file():
                    raise ValueError('missing receipt for ' + key)
                source = artifact['package']['source']['Url']
                if source['url'].startswith('ghcr://') and not (output / 'artifacts' / (source['sha256'] + '.tar.gz')).is_file():
                    raise ValueError('missing archive for ' + key)
    (output / 'index.json').write_text(json.dumps(index, sort_keys=True, separators=(',', ':')))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--inputs', type=Path, required=True)
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--rb', type=Path, required=True)
    args = parser.parse_args()
    assemble(args.inputs, args.output)
    subprocess.run([args.rb, 'package', 'verify-index', args.output / 'index.json', '--complete'], check=True)


if __name__ == '__main__':
    main()
