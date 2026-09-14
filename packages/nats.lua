return {
    name = "nats",
    description = "Manage and inspect NATS services",
    default_version = "0.4.0",
    source = {
        github = "nats-io/natscli",
        tag = "v{version}",
        repository_id = 318166068,
        assets = {
            ["aarch64-linux"] = "nats-{version}-linux-arm64.zip",
            ["aarch64-macos"] = "nats-{version}-darwin-arm64.zip",
            ["x86_64-linux"] = "nats-{version}-linux-amd64.zip",
        },
    },
    bins = { "nats" },
    checks = {
        { "nats", "--version" },
        { "nats", "--help" },
    },
    versions = {
        ["0.4.0"] = { revision = 2 },
    },
}
