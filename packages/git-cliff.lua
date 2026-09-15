return {
    schema = 2,
    name = "git-cliff",
    description = "Generate changelogs from Git history",
    default_version = "2.14.1",
    homepage = "https://github.com/orhun/git-cliff",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "orhun/git-cliff",
        repository_id = 372193147,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "orhun/git-cliff",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "git-cliff-{version}-x86_64-unknown-linux-musl.tar.gz",
                ["aarch64-macos"] = "git-cliff-{version}-aarch64-apple-darwin.tar.gz",
                ["aarch64-linux"] = "git-cliff-{version}-aarch64-unknown-linux-musl.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "git-cliff" },
        checks = { { "git-cliff", "--version" } },
    },
    versions = {
        ["2.14.1"] = {
            revision = 2,
        },
    },
}
