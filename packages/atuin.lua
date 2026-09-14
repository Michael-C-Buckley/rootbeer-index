return {
    name = "atuin",
    description = "Search and sync shell history",
    default_version = "18.22.0",
    source = {
        github = "atuinsh/atuin",
        tag = "v{version}",
        repository_id = 301244405,
        assets = {
            ["aarch64-linux"] = "atuin-aarch64-unknown-linux-musl.tar.gz",
            ["aarch64-macos"] = "atuin-aarch64-apple-darwin.tar.gz",
            ["x86_64-linux"] = "atuin-x86_64-unknown-linux-musl.tar.gz",
        },
    },
    bins = { "atuin" },
    checks = {
        { "atuin", "--version" },
        { "atuin", "--help" },
    },
    versions = {
        ["18.22.0"] = { revision = 2 },
    },
}
