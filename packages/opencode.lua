return {
    name = "opencode",
    description = "Work with coding agents in the terminal",
    default_version = "1.18.30",
    source = {
        github = "anomalyco/opencode",
        tag = "v{version}",
        repository_id = 975734319,
        assets = {
            ["aarch64-linux"] = "opencode-linux-arm64.tar.gz",
            ["aarch64-macos"] = "opencode-darwin-arm64.zip",
            ["x86_64-linux"] = "opencode-linux-x64-baseline.tar.gz",
        },
    },
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    bins = { "opencode" },
    checks = {
        { "opencode", "--version" },
    },
    versions = {
        ["1.18.30"] = { revision = 2 },
    },
}
