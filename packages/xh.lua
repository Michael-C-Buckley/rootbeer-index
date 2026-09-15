return {
    schema = 2,
    name = "xh",
    description = "Send HTTP requests from the terminal",
    default_version = "0.26.2",
    homepage = "https://github.com/ducaale/xh",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "ducaale/xh",
        repository_id = 294521053,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "ducaale/xh",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "xh-{tag}-x86_64-unknown-linux-musl.tar.gz",
                ["aarch64-macos"] = "xh-{tag}-aarch64-apple-darwin.tar.gz",
                ["aarch64-linux"] = "xh-{tag}-aarch64-unknown-linux-musl.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "xh" },
        checks = { { "xh", "--version" }, { "xh", "--offline", "GET", "https://example.com" } },
    },
    versions = {
        ["0.26.2"] = {
            revision = 2,
        },
    },
}
