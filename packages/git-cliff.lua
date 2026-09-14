return {
    name = "git-cliff",
    description = "Generate changelogs from Git history",
    default_version = "2.14.1",
    source = {
        github = "orhun/git-cliff",
        tag = "v{version}",
        repository_id = 372193147,
        assets = {
            ["aarch64-linux"] = "git-cliff-{version}-aarch64-unknown-linux-musl.tar.gz",
            ["aarch64-macos"] = "git-cliff-{version}-aarch64-apple-darwin.tar.gz",
            ["x86_64-linux"] = "git-cliff-{version}-x86_64-unknown-linux-musl.tar.gz",
        },
    },
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    bins = { "git-cliff" },
    checks = {
        { "git-cliff", "--version" },
    },
    versions = {
        ["2.14.1"] = { revision = 2 },
    },
}
