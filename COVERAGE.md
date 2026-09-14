# Package coverage

## Supported platforms

Active support covers macOS ARM64 and Linux ARM64/x86-64 through `current.json`.
Intel macOS is unsupported; the retired binary and frozen catalog channel are no longer
served. Existing immutable snapshots, receipts, and archives are retained.

CI uses one job per supported platform. Each builds the engine and exports with
`--workers 2 --jobs 2`, saving verified results even when another package fails.
Assembly requires complete declared coverage before publication.

## Published baseline

107 packages passed the three-platform gates and were published by
[run 34896137195](https://github.com/tale/rootbeer-index/actions/runs/34896137195)
from commit `ad44c47`, using engine `552938c`. All three platform jobs, assembly,
and publication passed without reruns in 3m47s. Update candidates remain separate
until reviewed.

Earlier public-client checks verified jq and Rush online and offline through
`current.json`, plus persistent installation with `rb use jq`. The retired Intel
binary and frozen `latest-v2.json` both return HTTP 404. Active support follows each recipe: gmx and Bobrwm are macOS ARM64-only;
Monstar is Linux x86-64-only. Native checks and offline reconstruction do not
establish that every interactive interface or external integration works.

Bobrwm revision 2 exports `Bobrwm.app` through the schema 3 catalog. Fresh public-client
checks verified temporary execution without an Applications link, persistent installation,
shared user/Lua ownership, removal after the last owner, and offline reuse. The symlink
resolves to the complete signed bundle; macOS metadata recognizes an application bundle
and strict code-signature verification passes. GUI launch, Accessibility permission
persistence across upgrades, and login items were not exercised.

## GNU Make

GNU Make 4.4.1 is published for all three platforms as package and command `make`.
The recipe builds the verified GNU release archive and runs the full upstream
suite. Optional Guile integration and translated messages are disabled.

A Darwin-only test adjustment uses `ar -S` to preserve the suite's non-object
archive fixtures and keeps SDK lookup caches outside temporary-file assertions.
GNU Make's runtime code is unchanged. The macOS binary links only to libSystem.

Package checks cover the exact version, recursive parallel builds, grouped targets,
no-op rebuilds, changed inputs, and offline reconstruction. A relocated macOS
artifact also compiled and linked a real static archive without rebuilding it on
a second invocation. Fresh public-client checks passed signed-index execution,
offline reuse, persistent installation, and removal.

GNU release intake remains manual; GitHub discovery does not track GNU's release
server. Source builds use the platform C toolchain and bootstrap Make.

## Current batch

This batch is published, with every declared platform qualified:

| Package | Version | Platforms | Notes |
| --- | --- | --- | --- |
| bobrwm | 0.1.0-main+572265d | macOS ARM64 | Pinned tip artifact; complete signed app bundle mirrored. |
| prtui | 0.3.0 | All three | Requires Git and authenticated GitHub CLI; Linux needs glibc 2.35+. |
| rush | 0.1.0-dev.20260909+g294212ebd35f5b755062186a66bcfd6436d3627a | All three | Pinned source snapshot built with Zig 0.16.0; patched version and executable-relative runtime data. |
| monstar | 1.0.1 | Linux x86-64 | Requires Wayland, glibc 2.36+, and the libraries below. |
| zig | 0.16.0 | All three | Complete compiler distribution; also builds Rush in CI. |

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

Live signed-index checks passed for prtui, Bobrwm, and Rush: one-off execution,
offline reuse, persistent installation, and Rush function autoload through profile
symlinks.

This batch originally published through `latest-v2.json`. Active-platform revisions
now publish through `current.json`; upgrade Rootbeer to use the current catalog.

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
   before publishing.
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
