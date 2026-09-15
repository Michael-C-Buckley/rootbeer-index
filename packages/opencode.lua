return {
    schema = 2,
    name = "opencode",
    description = "Work with coding agents in the terminal",
    default_version = "1.18.30",
    homepage = "https://github.com/anomalyco/opencode",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "anomalyco/opencode",
        repository_id = 975734319,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "anomalyco/opencode",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "opencode-linux-x64-baseline.tar.gz",
                ["aarch64-macos"] = "opencode-darwin-arm64.zip",
                ["aarch64-linux"] = "opencode-linux-arm64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "opencode" },
        checks = { { "opencode", "--version" } },
    },
    versions = {
        ["1.18.30"] = {
            revision = 2,
        },
    },
}
