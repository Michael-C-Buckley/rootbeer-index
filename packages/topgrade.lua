return {
    schema = 2,
    name = "topgrade",
    description = "Update installed tools and packages",
    homepage = "https://github.com/topgrade-rs/topgrade",
    default_version = "17.12.0",
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
                ["aarch64-linux"] = "topgrade-{tag}-aarch64-unknown-linux-musl.tar.gz",
                ["aarch64-macos"] = "topgrade-{tag}-aarch64-apple-darwin.tar.gz",
                ["x86_64-linux"] = "topgrade-{tag}-x86_64-unknown-linux-musl.tar.gz",
            },
        },
    },
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    outputs = {
        bins = { "topgrade" },
        checks = {
            { "topgrade", "--version" },
            { "topgrade", "--help" },
        },
    },
    versions = {
        ["17.11.0"] = {
            revision = 2,
        },
        ["17.12.0"] = {},
    },
}
