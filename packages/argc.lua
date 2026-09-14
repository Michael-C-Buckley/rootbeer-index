return {
    name = "argc",
    description = "Build command-line interfaces for shell scripts",
    default_version = "1.24.0",
    source = {
        github = "sigoden/argc",
        tag = "v{version}",
        repository_id = 461504676,
        assets = {
            ["aarch64-linux"] = "argc-{tag}-aarch64-unknown-linux-musl.tar.gz",
            ["aarch64-macos"] = "argc-{tag}-aarch64-apple-darwin.tar.gz",
            ["x86_64-linux"] = "argc-{tag}-x86_64-unknown-linux-musl.tar.gz",
            ["x86_64-macos"] = "argc-{tag}-x86_64-apple-darwin.tar.gz",
        },
    },
    bins = { "argc" },
    checks = {
        { "argc", "--argc-version" },
        { "argc", "--argc-help" },
    },
    versions = {
        ["1.24.0"] = {},
    },
}
