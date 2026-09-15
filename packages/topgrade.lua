return {
    schema = 2,
    name = "topgrade",
    description = "Update installed tools and packages",
    default_version = "17.11.0",
    homepage = "https://github.com/topgrade-rs/topgrade",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "topgrade-rs/topgrade",
        repository_id = 549714010,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "topgrade-rs/topgrade",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "topgrade-{tag}-x86_64-unknown-linux-musl.tar.gz",
                ["aarch64-macos"] = "topgrade-{tag}-aarch64-apple-darwin.tar.gz",
                ["aarch64-linux"] = "topgrade-{tag}-aarch64-unknown-linux-musl.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "topgrade" },
        checks = { { "topgrade", "--version" }, { "topgrade", "--help" } },
    },
    versions = {
        ["17.11.0"] = {
            revision = 2,
        },
    },
}
