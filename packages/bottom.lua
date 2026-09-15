return {
    schema = 2,
    name = "bottom",
    description = "Monitor processes and system resources",
    default_version = "0.14.9",
    homepage = "https://github.com/ClementTsang/bottom",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "ClementTsang/bottom",
        repository_id = 205042455,
        tag_prefix = "",
    },
    inputs = {
        prebuilt = {
            github = "ClementTsang/bottom",
            tag = "{version}",
            assets = {
                ["x86_64-linux"] = "bottom_x86_64-unknown-linux-musl.tar.gz",
                ["aarch64-macos"] = "bottom_aarch64-apple-darwin.tar.gz",
                ["aarch64-linux"] = "bottom_aarch64-unknown-linux-musl.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "btm" },
        checks = { { "btm", "--version" }, { "btm", "--help" } },
    },
    versions = {
        ["0.14.9"] = {
            revision = 2,
        },
    },
}
