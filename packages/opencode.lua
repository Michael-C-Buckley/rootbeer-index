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
            ["x86_64-macos"] = "opencode-darwin-x64-baseline.zip",
        },
    },
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux", "x86_64-macos" },
    bins = { "opencode" },
    checks = {
        { "opencode", "--version" },
    },
    versions = {
        ["1.18.30"] = {},
    },
}
