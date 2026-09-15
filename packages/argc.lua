return {
    schema = 2,
    name = "argc",
    description = "Build command-line interfaces for shell scripts",
    default_version = "1.24.0",
    homepage = "https://github.com/sigoden/argc",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "sigoden/argc",
        repository_id = 461504676,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "sigoden/argc",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "argc-{tag}-x86_64-unknown-linux-musl.tar.gz",
                ["aarch64-macos"] = "argc-{tag}-aarch64-apple-darwin.tar.gz",
                ["aarch64-linux"] = "argc-{tag}-aarch64-unknown-linux-musl.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "argc" },
        checks = { { "argc", "--argc-version" }, { "argc", "--argc-help" } },
    },
    versions = {
        ["1.24.0"] = {
            revision = 2,
        },
    },
}
