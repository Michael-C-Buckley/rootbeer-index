return {
    name = "oha",
    description = "Load test HTTP services",
    default_version = "1.16.0",
    source = {
        github = "hatoo/oha",
        tag = "v{version}",
        repository_id = 244377430,
        assets = {
            ["aarch64-linux"] = "oha-linux-arm64",
            ["aarch64-macos"] = "oha-macos-arm64",
            ["x86_64-linux"] = "oha-linux-amd64",
        },
    },
    bins = { "oha" },
    checks = {
        { "oha", "--version" },
        { "oha", "--help" },
    },
    versions = {
        ["1.16.0"] = { revision = 2 },
    },
}
