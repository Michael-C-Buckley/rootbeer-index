# CLI coverage

Coverage target: the 22 CLI packages in the existing Rootbeer package and Brew
modules. Desktop apps and language runtimes managed by mise are outside this batch.

## Recipe coverage

The catalog contains 15 of those packages:

- Existing: age, fd, ripgrep, xz.
- Added: chezmoi, delta, fzf, gh, git-lfs, jq, lsd, mise, mkcert, neovim, rage.

The new recipes use upstream GitHub releases and explicit asset names on Linux
and macOS, ARM and Intel. Delta defaults to 0.19.2 except on Intel macOS, where
0.18.2 is the newest available upstream binary. Explicit version requests do not
fall back. Neovim also checks its bundled runtime; jq evaluates a JSON expression,
and fzf checks shell integration generation.

Local checks qualify Apple Silicon only. All four CI jobs must pass before
publishing or migrating the user's declarations. These recipes require an engine
with platform-specific `default_versions` support. Ship that engine in Rootbeer
releases and update `ROOTBEER_REV` before publishing the new catalog.

## Remaining packages

| Package | Next work |
| --- | --- |
| make | Autotools candidate compiles; GNU Make 4.4.1 archive regression tests fail on the local Darwin 27 host. Investigate before admitting the recipe. |
| curl | Build TLS dependencies and establish certificate discovery and relocatable library paths. |
| git | Build dependency libraries and preserve helper executables and runtime data. |
| wget | Build TLS dependencies and establish certificate discovery. |
| rsync | Audit upstream build dependencies and select a portable feature set. |
| telnet | Choose an upstream implementation and qualify client-only builds. |
| 1password-cli | Vendor-hosted archives need a canonical HTTPS binary recipe, with explicit archive paths and hashes; the current GitHub source backend cannot represent them. |

Source-built dependencies should use pinned toolchains and declared inputs instead
of relying on Homebrew libraries installed on a CI runner. Before adding more engine
backends, separate the package model, resolution, and publication responsibilities;
extract crates when their dependencies can point in one direction.

After publication, migrate the covered declarations to canonical names. Keep the
remaining Brew/Aqua declarations until their replacements pass qualification.
