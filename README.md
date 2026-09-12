# Rootbeer package index

Canonical Lua recipes, native platform checks, and signed catalog publication.
Rootbeer binaries and their release history stay in `tale/rootbeer`.

- `recipes/`: canonical identities and exact source/backend recipes.
- `rb package export`: build or resolve packages, check commands and offline replay,
  then export a platform index. GitHub imports keep their locked upstream URLs.
- `rb package assemble`: merge platform outputs and require complete coverage.
- `rb package publish`: retain source archives as GHCR blobs and sign the Pages index.

Package semantics and tests live in the Rust engine. CI orchestrates these commands,
ORAS authentication, Git history, and Pages deployment; there is no Python dependency.

## Local checks

Use a Rootbeer build with `package export`, `assemble`, `publish`, and per-system
recipe `assets` support. Update `ROOTBEER_REV` to that engine commit before
publishing these recipes:

```sh
rb package --catalog recipes check
rb package --catalog recipes export --registry tale/rootbeer-index --output result
```

The workflow tests macOS 15 and Ubuntu 24.04 on ARM and Intel. It checks package
commands and offline replay; the engine's Rust test suite runs in `tale/rootbeer`.
Cargo caches are scoped by runner, Rust toolchain, engine revision, and lockfile.
The publisher uses a separate cache from recipe verification jobs. Platform jobs receive
no publishing credentials. The publisher runs separately on main, and signing is
gated on complete coverage for every declared version and platform. No GitHub
releases are created.

## Incremental verification

Normal pushes reuse successful package results. Each cache entry is keyed by the
exact recipe (including commands and revision), transitive dependency recipes,
platform, registry, engine binary, and build environment. Adding a package does
not invalidate unrelated results. Defaults and descriptions do not rebuild binaries.

A hit copies verified receipts and source archives into a complete platform bundle;
it does not resolve upstream releases, compile sources, or execute commands again.
Receipts retain their original catalog/provenance rather than claiming a new build.
Missing caches fall back to full verification; corrupt entries fail closed.

CI restores package results separately from Cargo caches and saves them only from
successful main-branch verification jobs. PRs can read main's results but cannot
promote their own results into publication. The runner image and toolchain are part
of the cache identity. Engine builds use a stable timestamp from the pinned commit.
Documentation-only pushes do not trigger package jobs.

Every Monday and on manual dispatch with `recheck` enabled, CI checks every recipe
again and refreshes successful cache entries. Locally:

```sh
rb package --catalog recipes export --registry tale/rootbeer-index --output result \
  --cache /tmp/rootbeer-package-results --cache-context "$BUILD_ENVIRONMENT_ID"
```

`BUILD_ENVIRONMENT_ID` must identify the OS image and build tools; change it when
they change. Add `--recheck` to bypass reuse. Only use trusted cache directories:
hashes detect corruption, but the cache is not an independently signed index.
GitHub cache eviction affects performance, not correctness. Archives are still
copied/uploaded as part of complete platform bundles, and publication still checks
anonymous GHCR access. This is incremental package verification, not a hermetic
source-build system or a permanent substitute for the published artifact store.

These workflow changes require an engine with `export --cache --cache-context`;
update `ROOTBEER_REV` before enabling them.

## Enable publication

The repository starts with publication disabled. After committing the Rootbeer
native publication commands, set repository variable `ROOTBEER_REV` to that full commit SHA.
The engine checkout is pinned; recipe-only changes do not require rebuilding a
Rootbeer release for users.

Create the `package-publishing` environment and restrict deployments to main. Select
GitHub Actions as the Pages source. Configure these publication values:

- `INDEX_URL`: Pages base URL, normally `https://tale.github.io/rootbeer-index`.
- `INDEX_PUBLIC_KEY`: 64 lowercase hexadecimal characters encoding the raw Ed25519 public key.
- Environment secret `INDEX_SIGNING_KEY`: base64-encoded Ed25519 PKCS#8 DER private key.
- `PUBLISH_INDEX`: `true` when publication is ready.

Keep the private key outside both repositories and back it up securely. Rootbeer
release builds must embed this same public key and `INDEX_URL` plus `/latest.json`
as `ROOTBEER_INDEX_PUBLIC_KEY` and `ROOTBEER_INDEX_URL`. The key is not fetched from
the index; that would remove the independent trust root.

New GHCR packages default to private. The first upload can therefore stop at its
anonymous-access check. Mark each `ghcr.io/tale/rootbeer-index/<name>` package public,
then rerun the workflow. It will not advertise an archive that anonymous clients
cannot access. ORAS is a publisher dependency only; `rb` downloads blobs natively.

The workflow stores Pages history on `gh-pages`, retaining `public/snapshots/<hash>.json`
and `public/receipts/<hash>.json`. Deployments include that entire retained history.
The signed `latest.json` pointer advances after archives are uploaded and verified.
Sequence numbers use `run_number * 1000 + run_attempt`; do not reset the workflow's
sequence history, and keep reruns below 1000 attempts. Older/conflicting sequences
are rejected by both signer and client. A key rotation needs a separate migration.

GHCR tags `sha256-<archive hash>` retain OCI manifests that reference immutable archive
blobs. Never delete those tags while supported locks refer to them. Package snapshots
contain the archive blob digest, not the OCI manifest digest. Imported upstream
artifacts retain upstream availability requirements.

## Bootstrap status

Recipes are initially copied from Rootbeer's embedded fallback catalog. Until the
release endpoint is enabled, keep that fallback synchronized deliberately. Nothing
has been published yet; engine pin, signing credentials, public package visibility,
and Pages configuration are deployment setup, not recipe contributions.
