import copy
import datetime
import hashlib
import io
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tarfile
import tomllib


def api(path):
    return json.loads(subprocess.check_output(['gh', 'api', path]))


def lua_value(value):
    if isinstance(value, dict):
        return '{ ' + ', '.join(f'[{json.dumps(key)}] = {lua_value(item)}' for key, item in sorted(value.items())) + ' }'
    if isinstance(value, list):
        return '{ ' + ', '.join(lua_value(item) for item in value) + ' }'
    if isinstance(value, (str, bool, int)):
        return json.dumps(value)
    raise ValueError('unsupported Rust build setting')


def update_recipe(source, revision, version, digest, timestamp, build):
    if not re.fullmatch(r'[0-9a-f]{40}', revision):
        raise ValueError('invalid source revision')
    if not re.fullmatch(r'[0-9]+\.[0-9]+\.[0-9]+', version):
        raise ValueError('unsupported Rootbeer base version')
    if not re.fullmatch(r'[0-9a-f]{64}', digest):
        raise ValueError('invalid source digest')

    version = f'{version}-main+{revision[:12]}'
    current = re.search(r'default_version\s*=\s*"([^"]+)"', source)
    if current is None:
        raise ValueError('missing default version')
    if current[1] == version:
        return source
    if f'["{version}"]' in source:
        raise ValueError('refusing to move back to a retained version')

    timestamp = datetime.datetime.fromisoformat(timestamp.replace('Z', '+00:00'))
    timestamp = timestamp.astimezone(datetime.timezone.utc).strftime('%Y-%m-%d %H:%M UTC')
    build = copy.deepcopy(build)
    build['rust'].setdefault('environment', {})['RB_BUILD_TIMESTAMP'] = timestamp
    entry = f'''versions = {{
        ["{version}"] = {{
            inputs = {{ source = {{
                url = "https://codeload.github.com/tale/rootbeer/tar.gz/{revision}",
                archive = "tar.gz",
                strip_prefix = "rootbeer-{revision}",
                sha256 = "{digest}",
            }} }},
            build = {lua_value(build)},
        }},'''
    source = source[:current.start(1)] + version + source[current.end(1):]
    source, count = re.subn(r'\bversions\s*=\s*\{', lambda _: entry, source, count=1)
    if count != 1:
        raise ValueError('missing versions table')
    return source


def main():
    repository = 'tale/rootbeer'
    head = api(f'repos/{repository}/commits/main')
    revision = head['sha']
    if not re.fullmatch(r'[0-9a-f]{40}', revision):
        raise ValueError('invalid upstream revision')
    runs = api(f'repos/{repository}/actions/workflows/build.yml/runs?event=push&head_sha={revision}&per_page=100')
    if not any(run['head_sha'] == revision and run['head_branch'] == 'main'
               and run['path'] == '.github/workflows/build.yml'
               and run['head_repository']['full_name'] == repository
               and run['conclusion'] == 'success' for run in runs['workflow_runs']):
        print('Rootbeer main is awaiting successful CI')
        return

    path = Path('packages/rootbeer.lua')
    source = path.read_text()
    current = re.search(r'default_version\s*=\s*"[^"+]+\+([0-9a-f]{12})"', source)
    if current is None:
        raise ValueError('expected a pinned Rootbeer main version')
    if revision.startswith(current[1]):
        return
    comparison = api(f'repos/{repository}/compare/{current[1]}...{revision}')
    if comparison['status'] != 'ahead':
        raise ValueError('Rootbeer update must advance its existing source revision')

    if '--probe' in sys.argv:
        with open(os.environ['GITHUB_OUTPUT'], 'a') as output:
            output.write('changed=true\n')
        return

    archive = subprocess.check_output(['curl', '--fail', '--silent', '--show-error', '--location',
                                       f'https://codeload.github.com/{repository}/tar.gz/{revision}'])
    with tarfile.open(fileobj=io.BytesIO(archive), mode='r:gz') as tar:
        manifest = tar.extractfile(f'rootbeer-{revision}/crates/rootbeer-cli/Cargo.toml')
        version = tomllib.loads(manifest.read().decode())['package']['version']
    catalog = json.loads(subprocess.check_output([
        'engine-bin/rootbeer-forge', '--catalog', 'packages', 'index']))
    package = catalog['packages']['rootbeer']
    resolved = package['versions'][package['default_version']]['build']
    build = {key: value for key, value in resolved.items()
             if key in {'backend', 'rust', 'configure', 'args', 'dependencies', 'steps'}}
    updated = update_recipe(source, revision, version, hashlib.sha256(archive).hexdigest(),
                            head['commit']['committer']['date'], build)
    destination = Path('candidates/packages')
    if not any(destination.glob('*.lua')):
        shutil.copytree('packages', destination, dirs_exist_ok=True)
    (destination / 'rootbeer.lua').write_text(updated)
    report_path = Path('candidates/report.json')
    report = json.loads(report_path.read_text())
    report['updated'] = sorted(set(report['updated']) | {'rootbeer'})
    report['untracked'] = [name for name in report['untracked'] if name != 'rootbeer']
    report_path.write_text(json.dumps(report, indent=2) + '\n')
    with Path('candidates/summary.md').open('a') as summary:
        summary.write(f'\nRootbeer: advance to CI-verified `{revision}`.\n')


if __name__ == '__main__':
    main()
