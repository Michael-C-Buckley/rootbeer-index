return {
    schema = 2,
    name = "atuin",
    description = "Search and sync shell history",
    default_version = "18.22.0",
    homepage = "https://github.com/atuinsh/atuin",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "atuinsh/atuin",
        repository_id = 301244405,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "atuinsh/atuin",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "atuin-x86_64-unknown-linux-musl.tar.gz",
                ["aarch64-macos"] = "atuin-aarch64-apple-darwin.tar.gz",
                ["aarch64-linux"] = "atuin-aarch64-unknown-linux-musl.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "atuin" },
        checks = { { "atuin", "--version" }, { "atuin", "--help" } },
    },
    versions = {
        ["18.22.0"] = {
            revision = 2,
        },
    },
}
