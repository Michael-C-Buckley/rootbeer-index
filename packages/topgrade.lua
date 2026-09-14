return {
    name = "topgrade",
    description = "Update installed tools and packages",
    default_version = "17.11.0",
    source = {
        github = "topgrade-rs/topgrade",
        tag = "v{version}",
        repository_id = 549714010,
        assets = {
            ["aarch64-linux"] = "topgrade-{tag}-aarch64-unknown-linux-musl.tar.gz",
            ["aarch64-macos"] = "topgrade-{tag}-aarch64-apple-darwin.tar.gz",
            ["x86_64-linux"] = "topgrade-{tag}-x86_64-unknown-linux-musl.tar.gz",
        },
    },
    bins = { "topgrade" },
    checks = {
        { "topgrade", "--version" },
        { "topgrade", "--help" },
    },
    versions = {
        ["17.11.0"] = { revision = 2 },
    },
}
