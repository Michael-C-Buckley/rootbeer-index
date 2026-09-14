return {
    name = "dprint",
    description = "Format source files with configurable plugins",
    default_version = "0.57.4",
    source = {
        github = "dprint/dprint",
        tag = "{version}",
        repository_id = 192136193,
        assets = {
            ["aarch64-linux"] = "dprint-aarch64-unknown-linux-musl.zip",
            ["aarch64-macos"] = "dprint-aarch64-apple-darwin.zip",
            ["x86_64-linux"] = "dprint-x86_64-unknown-linux-musl.zip",
            ["x86_64-macos"] = "dprint-x86_64-apple-darwin.zip",
        },
    },
    bins = { "dprint" },
    checks = {
        { "dprint", "--version" },
        { "dprint", "help" },
    },
    versions = {
        ["0.57.4"] = {},
    },
}
