return {
    schema = 2,
    name = "dprint",
    description = "Format source files with configurable plugins",
    default_version = "0.57.4",
    homepage = "https://github.com/dprint/dprint",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "dprint/dprint",
        repository_id = 192136193,
        tag_prefix = "",
    },
    inputs = {
        prebuilt = {
            github = "dprint/dprint",
            tag = "{version}",
            assets = {
                ["x86_64-linux"] = "dprint-x86_64-unknown-linux-musl.zip",
                ["aarch64-macos"] = "dprint-aarch64-apple-darwin.zip",
                ["aarch64-linux"] = "dprint-aarch64-unknown-linux-musl.zip",
            },
        },
    },
    outputs = {
        bins = { "dprint" },
        checks = { { "dprint", "--version" }, { "dprint", "help" } },
    },
    versions = {
        ["0.57.4"] = {
            revision = 2,
        },
    },
}
