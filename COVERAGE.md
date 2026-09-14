# CLI coverage

## Published baseline

97 packages passed the native platform gates and were published by
[run 34794818699](https://github.com/tale/rootbeer-index/actions/runs/34794818699)
from commit `96ee74badcb08311678fe541425b31f22798d471`.

Support follows each recipe: gmx is macOS-only, and choose has no Intel macOS
binary in its published release history. The other packages from the previous
expansion declare macOS and Linux on ARM64 and x86-64. Native command checks and
offline reconstruction verify installation; they do not establish that every
interactive interface or external integration works.

## Current batch

These four candidates exercise the corrected raw GitHub executable naming path.
They are not part of the published baseline until their qualification and
publication gates pass.

| Package | Command | Upstream |
| --- | --- | --- |
| shfmt | `shfmt` | `mvdan/sh` |
| tealdeer | `tldr` | `tealdeer-rs/tealdeer` |
| docker-compose | `docker-compose` | `docker/compose` |
| argocd | `argocd` | `argoproj/argo-cd` |

All four passed native macOS ARM64 checks and offline reconstruction. shfmt also
passed a formatting check, and Compose validated a sample configuration without
a daemon. The four-platform CI gate is pending.

Compose needs a container engine; Argo CD needs the relevant cluster or service
for remote operations. Installing the clients does not provision those systems.

## Maintenance batch

Candidate updates: chezmoi 2.72.2, lazygit 0.65.1, and mise 2026.9.7. Older
recipes are retained. gitui 0.28.1 revision 2 follows its move to
`gitui-org/gitui`, verified against the unchanged repository ID.

All eight retained/new recipes passed native macOS ARM64 checks and offline
reconstruction. Discovery against the resulting 101-package catalog reported
100 unchanged GitHub packages, zero errors, and xz untracked. Publication awaits
the four-platform gate.

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
