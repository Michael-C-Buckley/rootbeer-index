"""Build or resolve recipes, test commands and offline replay, then export a platform index."""
import argparse
import copy
import hashlib
import json
import os
from pathlib import Path
import platform
import shutil
import subprocess
import tempfile


def run(args, env=None, timeout=1800):
    subprocess.run(args, env=env, check=True, timeout=timeout)


def write_json(path, value):
    path.write_text(json.dumps(value, sort_keys=True, separators=(',', ':')))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--rb', type=Path, required=True)
    parser.add_argument('--recipes', type=Path, default=Path('recipes'))
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--registry', required=True)
    args = parser.parse_args()
    rb = args.rb.resolve(strict=True)
    recipes = args.recipes.resolve(strict=True)
    args.output.mkdir()
    for name in ('artifacts', 'receipts'):
        (args.output / name).mkdir()
    catalog = json.loads(subprocess.check_output([rb, 'package', '--catalog', recipes, 'index']))
    digest = subprocess.check_output([rb, 'package', '--catalog', recipes, 'check'], text=True).strip().split('sha256:')[1]
    system = {'arm64': 'aarch64'}.get(platform.machine(), platform.machine()) + '-' + {'Darwin': 'macos', 'Linux': 'linux'}[platform.system()]
    index = {'schema': 1, 'catalog': catalog, 'catalog_sha256': digest, 'artifacts': {}}
    for name, entry in catalog['packages'].items():
        for version, recipe in entry['versions'].items():
            if system not in recipe['systems']:
                continue
            key = name + '@' + version
            with tempfile.TemporaryDirectory(prefix='rootbeer-check-') as directory:
                root = Path(directory)
                env = os.environ.copy()
                env.update(HOME=str(root), XDG_STATE_HOME=str(root / 'state'), XDG_DATA_HOME=str(root / 'data'), XDG_CONFIG_HOME=str(root / 'config'), XDG_CACHE_HOME=str(root / 'cache'))
                if recipe.get('build'):
                    build = root / 'build'
                    run([rb, 'package', '--catalog', recipes, 'build', key, '--output', build], env)
                    script = build / 'install.lua'
                    bundle = root / 'bundle'
                    run([rb, 'package', '--catalog', recipes, 'bundle', '--receipt', build / 'receipt.json', '--base-url', 'ghcr://' + args.registry + '/' + name, '--output', bundle], env)
                    artifact = json.loads((bundle / 'index.json').read_text())['artifacts'][key][system]
                else:
                    script = root / 'init.lua'
                    script.write_text('local rb = require("rootbeer")\nrb.package(' + json.dumps(recipe['source']) + ')\n')
                run([rb, 'apply', '--script', script], env)
                lock_path = script.parent / 'rootbeer.lock'
                lock_bytes = lock_path.read_bytes()
                if not recipe.get('build'):
                    lock = json.loads(lock_bytes)
                    package = copy.deepcopy(next(iter(lock['packages'].values())))
                    package['name'], package['version'] = name, version
                    package['provides']['bins'] = {bin: package['provides']['bins'][bin] for bin in recipe['bins']}
                    receipt = {'schema': 1, 'catalog_sha256': digest, 'system': system, 'revision': recipe['revision'], 'source_lock': lock, 'package': package}
                    receipt_bytes = json.dumps(receipt, sort_keys=True, separators=(',', ':')).encode()
                    receipt_sha = hashlib.sha256(receipt_bytes).hexdigest()
                    artifact = {'revision': recipe['revision'], 'receipt_sha256': receipt_sha, 'package': package}
                candidate = {**index, 'artifacts': {key: {system: artifact}}}
                candidate_path = root / 'candidate.json'
                write_json(candidate_path, candidate)
                if recipe.get('build'):
                    archive_sha = artifact['package']['source']['Url']['sha256']
                    downloads = root / 'state/rootbeer/downloads'
                    downloads.mkdir(parents=True, exist_ok=True)
                    shutil.copyfile(bundle / 'artifacts' / (archive_sha + '.tar.gz'), downloads / ('sha256-' + archive_sha))
                script = root / 'canonical/init.lua'
                script.parent.mkdir()
                script.write_text('local rb = require("rootbeer")\nrb.package_index({url=' + json.dumps(candidate_path.as_uri())
                                  + ',sha256=' + json.dumps(hashlib.sha256(candidate_path.read_bytes()).hexdigest())
                                  + '})\nrb.package(' + json.dumps(key) + ')\n')
                run([rb, 'apply', '--script', script], env)
                lock_path = script.parent / 'rootbeer.lock'
                lock_bytes = lock_path.read_bytes()
                profile = root / 'state/rootbeer/profiles/default/current'
                for check in recipe['checks']:
                    run([profile / 'bin' / check[0], *check[1:]], {'HOME': str(root), 'PATH': str(profile / 'bin') + ':/usr/bin:/bin'}, 30)
                shutil.rmtree(profile)
                shutil.rmtree(root / 'state/rootbeer/store')
                run([rb, 'apply', '--script', script, '--offline'], env)
                if lock_path.read_bytes() != lock_bytes:
                    raise ValueError('offline apply changed the lock')
                for bin in recipe['bins']:
                    if not (profile / 'bin' / bin).is_file():
                        raise ValueError('offline apply did not restore ' + bin)
                if recipe.get('build'):
                    for folder in ('artifacts', 'receipts'):
                        for file in (bundle / folder).iterdir():
                            shutil.copyfile(file, args.output / folder / file.name)
                else:
                    (args.output / 'receipts' / (receipt_sha + '.json')).write_bytes(receipt_bytes)
                index['artifacts'].setdefault(key, {})[system] = artifact
                print('PASS ' + key + ' on ' + system, flush=True)
    write_json(args.output / 'index.json', index)
    run([rb, 'package', 'verify-index', args.output / 'index.json'])


if __name__ == '__main__':
    main()
