# CLI coverage

## Published baseline

101 packages passed the native platform gates and were published by
[run 34807114915](https://github.com/tale/rootbeer-index/actions/runs/34807114915)
from commit `9a87da4`. All 32 qualification shards, assembly, and publication
passed. [Upstream discovery](https://github.com/tale/rootbeer-index/actions/runs/34806611251)
also passed with zero errors.

Support follows each recipe: gmx is macOS-only, and choose has no Intel macOS
binary in its published release history. The other packages from the previous
expansion declare macOS and Linux on ARM64 and x86-64. Native command checks and
offline reconstruction verify installation; they do not establish that every
interactive interface or external integration works.

## Current candidates

This batch awaits qualification on every declared platform:

| Package | Version | Platforms | Notes |
| --- | --- | --- | --- |
| bobrwm | 0.1.0-main+572265d | macOS ARM64 | Pinned tip artifact; complete signed app bundle mirrored. |
| prtui | 0.3.0 | All four | Requires Git and authenticated GitHub CLI; Linux needs glibc 2.35+. |
| rush | 0.1.0-dev.20260909+g294212ebd35f5b755062186a66bcfd6436d3627a | All four | Pinned source snapshot built with Zig 0.16.0; patched version and executable-relative runtime data. |
| monstar | 1.0.1 | Linux x86-64 | Requires Wayland, glibc 2.36+, and the libraries below. |
| zig | 0.16.0 | All four | Complete compiler distribution; also builds Rush in CI. |

Prise is deprecated and excluded. Rush snapshots and Bobrwm tip artifacts require
manual intake with pinned sources; discovery does not silently follow their heads.

Local macOS ARM64 checks passed for prtui and Bobrwm, including offline
reconstruction. Bobrwm's mirrored app retained its files and valid code signature;
its window manager and macOS permission flows were not launched. Use
`rb run bobrwm --app Bobrwm.app` to open the app; `rb use bobrwm` installs its CLI.

Monstar passed version/help checks and its headless rendering benchmark in a
disposable Linux x86-64 container. Its interactive Wayland session remains untested.
It needs libwayland-client, libwayland-cursor, Fontconfig, FreeType, HarfBuzz,
libxkbcommon, and installed fonts. Rootbeer does not install these system libraries.

Rush passed its upstream tests and relocated shell/function-autoload checks on
macOS ARM64. Package checks exercise quoting, substitution, arithmetic, bundled
functions, and the exact snapshot version after installation and offline recovery.

The new catalog uses `latest-v2.json`. The existing `latest.json` and immutable
history remain available to older clients; upgrade Rootbeer for this batch.

## Added packages

These four tools are published, with installed command names taken from their
recipes even when upstream repository and executable names differ.

| Package | Command | Upstream |
| --- | --- | --- |
| shfmt | `shfmt` | `mvdan/sh` |
| tealdeer | `tldr` | `tealdeer-rs/tealdeer` |
| docker-compose | `docker-compose` | `docker/compose` |
| argocd | `argocd` | `argoproj/argo-cd` |

All four passed native macOS ARM64 checks and offline reconstruction. shfmt also
passed a formatting check, and Compose validated a sample configuration without
a daemon. All declared platforms passed CI. Live signed-index checks verified
`rb run`, offline reuse, persistent `rb use`, and `rb env` in an isolated user
profile without a Lua configuration.

Compose needs a container engine; Argo CD needs the relevant cluster or service
for remote operations. Installing the clients does not provision those systems.

## Maintenance

Published updates: chezmoi 2.72.2, lazygit 0.65.1, and mise 2026.9.7. Older
recipes are retained. gitui 0.28.1 revision 2 follows its move to
`gitui-org/gitui`, verified against the unchanged repository ID.

All eight retained/new recipes passed native macOS ARM64 checks and offline
reconstruction. Discovery against the resulting 101-package catalog reported
100 unchanged GitHub packages, zero errors, and xz untracked. All declared
platforms passed CI. Live client checks verified the updated versions online and
offline, and persistent installation retained the earlier batch.

## Package intake

1. Collect demand from dotfile package lists and missing tools. Record the
   canonical package, exported command, upstream, and the source list that needs
   it. Deduplicate aliases and overlapping Brew, Mise, and Rootbeer declarations.
2. Choose a small batch with exact releases and explicit platform assets. Keep
   unresolved engine gaps in the shortlist; fix them before expanding the batch.
3. Run native functional checks and offline reconstruction with isolated homes
   and profiles. Require CI checks on every declared macOS/Linux architecture
   before publishing; ARM64 qualification does not establish Intel support.
4. Publish only the verified bundle, then verify the signed index through a
   client run and installation. Update this baseline after that succeeds; only
   then migrate the corresponding dotfile declarations.
5. Keep upstream discovery settings with each recipe. Discovered releases go
   through the same qualification and publication gates before becoming defaults.

## Runtime dependencies

- gmx integrates Ghostty and zmx; both must also be installed.
- dive and lazydocker need a container engine; kind and minikube need a driver.
- Kubernetes clients and NATS need the relevant cluster or service.
- Go build and code-generation tools need the project toolchain.
- dprint needs configured formatting plugins; helmfile needs Helm.
- Yazi previews may need additional utilities. Yazi also exports `ya`.
- topgrade updates other installed tools; installation does not run an upgrade.

## Remaining shortlist

These candidates remain deferred or need investigation.

| Package | Next work |
| --- | --- |
| lua-language-server | On macOS, execute its canonical binary path while preserving argv. Supply writable log/meta paths outside the store; even `--version` otherwise mutates it. Qualification must check diagnostics and unchanged store hashes. |
| tokei | Newest stable releases have no binaries; the last stable binary release, 12.1.2, lacks macOS ARM64. Assess source builds rather than silently choosing an old version. |
| make | Revisit the GNU Make 4.4.1 Darwin archive-test failure before admitting a source recipe. |
| curl | Qualify TLS dependencies, certificate discovery, and relocatable libraries. |
| git | Qualify dependencies, helper executables, and runtime data. |
| wget | Qualify TLS dependencies and certificate discovery. |
| rsync | Audit build dependencies and the portable feature set. |
| telnet | Select an upstream implementation and qualify client-only builds. |
| 1password-cli | Support verified vendor-hosted archives; retain the existing Aqua declaration for now. |
| helm | Assess vendor-hosted release archives and command checks. |
| kubectl | Assess vendor-hosted binaries and version selection. |
| gopls | Assess reproducible Go builds and language-server checks. |
| goimports | Assess reproducible Go builds and formatting checks. |
| rust-analyzer | Audit release selection and compatibility with the user's Rust toolchains. |
| nmap | Audit dependencies and bundled runtime data. |
| git-filter-repo | Audit Python runtime requirements and launcher behavior. |

Other candidates rejected during the previous qualification pass:

| Candidate | Reason |
| --- | --- |
| Hugo | The inspected macOS release uses an unsupported `.pkg` installer. |
| Crossplane, sniffer | The inspected releases have no usable binary assets. |
| Podman | Release artifacts provide remote clients rather than a complete local engine. |
| eza | The inspected binary releases omit macOS. |
| fselect | macOS ARM64 uses an unsupported standalone gzip artifact. |
| qsv | Linux installation failed because its ZIP provides no executable files recognizable by the current resolver. |

Language runtimes and npm-based language servers remain managed by Mise in this
pass. Existing Brew dependencies and desktop applications remain installed.
