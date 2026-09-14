# CLI coverage

The candidate catalog contains 97 packages: 25 existing packages, the previous
22-package expansion, and another 50 additions. New recipes remain unpublished
until the four-platform CI gate passes.

## Previous 22-package batch

| Use | New packages |
| --- | --- |
| Tools already installed locally | agg, asciinema, gmx, opencode, rustic, stylua, tree-sitter, typst, uv, zmx |
| Shell and workflow checks | actionlint, shellcheck |
| Git and API tools | git-cliff, gitui, grpcurl |
| Terminal and system tools | atuin, bottom (`btm`), dive, fastfetch, procs, watchexec, zellij |

Recipes use exact upstream releases with verified repository IDs and explicit
asset names. Discovery uses the same source settings. Existing versions and
recipes are unchanged.

All additions declare macOS and Linux on ARM64 and x86-64 except gmx, whose
upstream releases provide macOS binaries only. gmx is an integration for Ghostty
and zmx: those tools must also be installed. Installing dive does not install a
container engine. Runtime integrations need separate user setup; version/help
checks do not establish that those integrations work.

All 22 additions passed native checks and offline reconstruction on macOS ARM64.
All 21 Linux-supported additions passed the same checks in the isolated Ubuntu
24.04 ARM64 OrbStack VM. The four-platform CI gate must pass before
publication or migrating these new names into a user's configuration. Local
qualification does not establish Intel support by itself.

## Additional 50-package batch

| Use | Packages |
| --- | --- |
| Development tools | air, buf, caddy, dasel, dprint, glow, golangci-lint, goose, goreleaser, gum, lefthook, migrate, mockery, nats, sqlc, task |
| Containers and Kubernetes | cosign, devspace, flux, grype, helmfile, hubble, k9s, kind, kompose, lazydocker, minikube, oras, skaffold, stern, syft, tilt, trivy |
| Terminal utilities | argc, bandwhich, choose, doggo, dufs, gping, grex, hexyl, intermodal, miniserve, oha, ouch, pastel, topgrade, vivid, xh, yazi |

All 50 additions passed native macOS ARM64 and Linux ARM64 command checks and
offline reconstruction. Each exported recipe was compared with the final catalog.
Intel execution remains for CI. Choose has no Intel macOS binary in its published
release history; its recipe declares the other three platforms.
Yazi also exports `ya`. Checks use temporary homes and profiles without Homebrew
on PATH. This verifies installation and command startup, not every external
integration or interactive interface.

Some commands need separately installed tools or services:

- Go build and code-generation tools need the project toolchain.
- dprint needs formatting plugins selected in the user's configuration.
- helmfile needs Helm; lazydocker needs Docker; kind and minikube need a driver.
- Kubernetes clients and NATS need the relevant cluster or service.
- topgrade updates other installed tools; installation does not run an upgrade.
- Yazi preview features may need additional utilities.

Candidates replaced during qualification:

| Candidate | Reason |
| --- | --- |
| Hugo | The newest macOS release uses an unsupported `.pkg` installer. |
| Docker Compose, Argo CD | Raw executable names differ from repository names, the same gap as shfmt. |
| Crossplane, sniffer | Latest releases have no usable binary assets. |
| Podman | Release artifacts provide remote clients rather than a complete local engine. |
| eza | Current binary releases omit macOS. |
| fselect | macOS ARM64 uses an unsupported standalone gzip artifact. |
| qsv | Actual Linux installation failed because its ZIP provides no executable files recognizable by the current resolver. |

## Remaining shortlist

The following 18 candidates are deferred or need investigation. They are not
included in the new package count.

| Package | Next work |
| --- | --- |
| lua-language-server | Actual export failed: the launcher looks for `main.lua` beside the profile symlink. Preserve its runtime lookup through a supported launcher strategy. |
| shfmt | Actual export failed: the raw GitHub backend exposes the repository name `sh`, not the declared `shfmt` command. Support explicit raw executable naming. |
| tealdeer | Actual export failed: the raw download needs to expose `tldr`, not the repository name. Same naming gap as shfmt. |
| tokei | Newest stable releases have no binaries; the last stable binary release, 12.1.2, lacks macOS ARM64. Assess source builds instead of silently choosing an old version. |
| make | Revisit the earlier GNU Make 4.4.1 Darwin archive-test failure before admitting a source recipe. |
| curl | Qualify TLS dependencies, certificate discovery, and relocatable libraries. |
| git | Qualify dependencies, helper executables, and runtime data. |
| wget | Qualify TLS dependencies and certificate discovery. |
| rsync | Audit build dependencies and the portable feature set. |
| telnet | Select an upstream implementation and qualify client-only builds. |
| 1password-cli | Add support for verified vendor-hosted archives; retain the existing Aqua declaration for now. |
| helm | Assess the vendor-hosted release archives and command checks. |
| kubectl | Assess the vendor-hosted binaries and version-selection policy. |
| gopls | Assess reproducible Go builds and language-server checks. |
| goimports | Assess reproducible Go builds and formatting checks. |
| rust-analyzer | Audit release selection and compatibility with the user's Rust toolchains. |
| nmap | Audit dependencies and bundled runtime data. |
| git-filter-repo | Audit Python runtime requirements and launcher behavior. |

Language runtimes and npm-based language servers remain managed by Mise in this
pass. Existing Brew dependencies and desktop applications remain installed.
