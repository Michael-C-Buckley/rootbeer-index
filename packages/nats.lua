return {
    schema = 2,
    name = "nats",
    description = "Manage and inspect NATS services",
    homepage = "https://github.com/nats-io/natscli",
    default_version = "0.5.0",
    upstream = {
        github = "nats-io/natscli",
        repository_id = 318166068,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "nats-io/natscli",
            tag = "v{version}",
            assets = {
                ["aarch64-linux"] = "nats-{version}-linux-arm64.zip",
                ["aarch64-macos"] = "nats-{version}-darwin-arm64.zip",
                ["x86_64-linux"] = "nats-{version}-linux-amd64.zip",
            },
        },
    },
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    outputs = {
        bins = { "nats" },
        checks = {
            { "nats", "--version" },
            { "nats", "--help" },
        },
    },
    versions = {
        ["0.4.0"] = {
            revision = 2,
        },
        ["0.5.0"] = {},
    },
}
