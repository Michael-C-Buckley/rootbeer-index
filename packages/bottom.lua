return {
    name = "bottom",
    description = "Monitor processes and system resources",
    default_version = "0.14.9",
    source = {
        github = "ClementTsang/bottom",
        tag = "{version}",
        repository_id = 205042455,
        assets = {
            ["aarch64-linux"] = "bottom_aarch64-unknown-linux-musl.tar.gz",
            ["aarch64-macos"] = "bottom_aarch64-apple-darwin.tar.gz",
            ["x86_64-linux"] = "bottom_x86_64-unknown-linux-musl.tar.gz",
            ["x86_64-macos"] = "bottom_x86_64-apple-darwin.tar.gz",
        },
    },
    bins = { "btm" },
    checks = {
        { "btm", "--version" },
        { "btm", "--help" },
    },
    versions = {
        ["0.14.9"] = {},
    },
}
