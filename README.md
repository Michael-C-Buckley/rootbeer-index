# Rootbeer package index

Packages for [Rootbeer](https://rootbeer.tale.me), with package recipes
for Apple silicon macOS and Linux on ARM64 and x86-64. Availability varies by package.

[Browse packages](https://rootbeer.tale.me/packages/) ·
[Install Rootbeer](https://rootbeer.tale.me/guide/getting-started) ·
[Package guide](https://rootbeer.tale.me/guide/packages)

## Use a package

Run a tool without creating a Rootbeer configuration:

```sh
rb run jq -- --version
```

Keep it available for everyday use:

```sh
rb use jq
eval "$(rb env)"
jq --version
```

Add `@version` to request an exact release, such as `jq@1.8.2`. You can also manage
packages alongside your dotfiles with `rb.package("jq")` in your Lua configuration.
Rootbeer installs prebuilt packages; installation does not compile them locally.

Packages can also export macOS apps: `rb use bobrwm` links `Bobrwm.app` into
`~/Applications`. Existing apps are never overwritten. `rb unuse bobrwm` removes
the user installation, retaining the app link if your Lua configuration still needs it.
For an existing Bobrwm installation, run `rb update`, then `rb use bobrwm --update`.

Run `rb update` on supported platforms to use the active `current.json` catalog.
Intel macOS is unsupported; its retired binary and frozen catalog channel are no longer
served. Published snapshots, receipts, and archives remain available for existing locks.

## Contribute a package

Recipes live in [`packages/`](packages/), one Lua file per tool. Start with an
existing recipe such as [`jq.lua`](packages/jq.lua), then follow the
[package authoring guide](https://rootbeer.tale.me/contributing/packaging).

- Use the canonical lowercase name and exact upstream versions.
- Declare only platforms you can verify, with checks that exercise the tool.
- Keep older versions. Increment the revision when changing an existing recipe.
- Review shared settings carefully: changes can affect every retained version.

From this repository, validate the catalog and test packages for your platform:

```sh
rb package --catalog packages check
rb package --catalog packages export --registry tale/rootbeer-index --output result --workers 2 --jobs 2
```

Use a current Rootbeer build and a new output directory. Export downloads or builds
packages and runs their declared checks, so it requires network access and can take
time. Open a pull request with the recipe changes; CI verifies all declared
platforms before publication.

The [upstream discovery workflow](.github/workflows/discovery.yml) checks for new
releases and produces candidate recipes for review. It does not merge or publish
them automatically.

See [CLI coverage](COVERAGE.md) for the current expansion batch and qualification
status. New recipes remain candidates until all declared platform jobs pass.

## Report a problem

For a missing tool, broken package, or outdated version, [open an issue here](https://github.com/tale/rootbeer-index/issues).
Include the package, requested version, platform, and error output when applicable.
For problems with `rb` itself, use the [Rootbeer repository](https://github.com/tale/rootbeer/issues).

## Maintenance

The [publication workflow](.github/workflows/packages.yml) verifies recipes and
publishes the signed index. Each of three platform jobs builds its engine and
exports with two package workers and two compiler jobs per build. Verified results
are cached per engine and environment, including successful work from failed runs.
Package updates are independent of Rootbeer binary
releases. See [index hosting and trust](https://rootbeer.tale.me/contributing/package-hosting)
for deployment and client verification details.

Retain published snapshots, receipts, and package archives: existing lockfiles
still depend on them.
