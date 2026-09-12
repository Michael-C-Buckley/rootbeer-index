"""Publish immutable GHCR blobs, then sign and retain the complete Pages snapshot."""
import argparse
import base64
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import urllib.parse
import urllib.request


def run(args, **kwargs):
    subprocess.run(args, check=True, **kwargs)


def check_public(repository, digest):
    query = urllib.parse.urlencode({'service': 'ghcr.io', 'scope': 'repository:' + repository + ':pull'})
    with urllib.request.urlopen('https://ghcr.io/token?' + query, timeout=30) as response:
        token = json.load(response)['token']
    request = urllib.request.Request('https://ghcr.io/v2/' + repository + '/blobs/sha256:' + digest,
                                     method='HEAD', headers={'Authorization': 'Bearer ' + token})
    with urllib.request.urlopen(request, timeout=30) as response:
        if response.status != 200:
            raise ValueError('GHCR blob is not publicly readable')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--rb', type=Path, required=True)
    parser.add_argument('--bundle', type=Path, required=True)
    parser.add_argument('--site', type=Path, required=True)
    parser.add_argument('--site-url', required=True)
    parser.add_argument('--registry', required=True)
    parser.add_argument('--sequence', type=int, required=True)
    args = parser.parse_args()
    rb, bundle, site = args.rb.resolve(), args.bundle.resolve(), args.site.resolve()
    run([rb, 'package', 'verify-index', bundle / 'index.json', '--complete'])
    index = json.loads((bundle / 'index.json').read_bytes())
    blobs = set()
    for systems in index['artifacts'].values():
        for artifact in systems.values():
            source = artifact['package']['source']['Url']
            if not source['url'].startswith('ghcr://'):
                continue
            repository, digest = source['url'][7:].split('@sha256:')
            if not repository.startswith(args.registry + '/') or digest != source['sha256']:
                raise ValueError('artifact is outside the publication namespace')
            blobs.add((repository, digest))
    for repository, digest in sorted(blobs):
        archive = bundle / 'artifacts' / (digest + '.tar.gz')
        if hashlib.sha256(archive.read_bytes()).hexdigest() != digest:
            raise ValueError('archive hash mismatch')
        run(['oras', 'push', 'ghcr.io/' + repository + ':sha256-' + digest,
             '--artifact-type', 'application/vnd.rootbeer.package.v1',
             '--annotation', 'org.opencontainers.image.source=https://github.com/' + os.environ['GITHUB_REPOSITORY'],
             archive.name + ':application/gzip'], cwd=archive.parent, env={key: value for key, value in os.environ.items() if key != 'INDEX_SIGNING_KEY'})
        check_public(repository, digest)
    public = site / 'public'
    (public / 'snapshots').mkdir(parents=True, exist_ok=True)
    (public / 'receipts').mkdir(exist_ok=True)
    index_bytes = (bundle / 'index.json').read_bytes()
    digest = hashlib.sha256(index_bytes).hexdigest()
    snapshot = public / 'snapshots' / (digest + '.json')
    if snapshot.exists() and snapshot.read_bytes() != index_bytes:
        raise ValueError('immutable snapshot collision')
    snapshot.write_bytes(index_bytes)
    for receipt in (bundle / 'receipts').iterdir():
        target = public / 'receipts' / receipt.name
        if target.exists() and target.read_bytes() != receipt.read_bytes():
            raise ValueError('immutable receipt collision')
        shutil.copyfile(receipt, target)
    with tempfile.TemporaryDirectory() as directory:
        key = Path(directory) / 'key.der'
        descriptor = os.open(key, os.O_CREAT | os.O_EXCL | os.O_WRONLY, 0o600)
        with os.fdopen(descriptor, 'wb') as file:
            file.write(base64.b64decode(os.environ['INDEX_SIGNING_KEY'], validate=True))
        manifest = Path(directory) / 'latest.json'
        command = [rb, 'package', 'sign-index', snapshot, '--url', args.site_url.rstrip('/') + '/snapshots/' + digest + '.json',
                   '--sequence', str(args.sequence), '--key', key, '--public-key', os.environ['INDEX_PUBLIC_KEY'], '--output', manifest]
        if (public / 'latest.json').exists():
            command += ['--previous', public / 'latest.json']
        run(command)
        shutil.copyfile(manifest, public / 'latest.json')
    (public / '.nojekyll').touch()


if __name__ == '__main__':
    main()
