return {
    name = "xh",
    description = "Send HTTP requests from the terminal",
    default_version = "0.26.2",
    source = {
        github = "ducaale/xh",
        tag = "v{version}",
        repository_id = 294521053,
        assets = {
            ["aarch64-linux"] = "xh-{tag}-aarch64-unknown-linux-musl.tar.gz",
            ["aarch64-macos"] = "xh-{tag}-aarch64-apple-darwin.tar.gz",
            ["x86_64-linux"] = "xh-{tag}-x86_64-unknown-linux-musl.tar.gz",
        },
    },
    bins = { "xh" },
    checks = {
        { "xh", "--version" },
        { "xh", "--offline", "GET", "https://example.com" },
    },
    versions = {
        ["0.26.2"] = { revision = 2 },
    },
}
