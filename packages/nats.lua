return {
    schema = 2,
    name = "nats",
    description = "Manage and inspect NATS services",
    default_version = "0.4.0",
    homepage = "https://github.com/nats-io/natscli",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
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
                ["x86_64-linux"] = "nats-{version}-linux-amd64.zip",
                ["aarch64-macos"] = "nats-{version}-darwin-arm64.zip",
                ["aarch64-linux"] = "nats-{version}-linux-arm64.zip",
            },
        },
    },
    outputs = {
        bins = { "nats" },
        checks = { { "nats", "--version" }, { "nats", "--help" } },
    },
    versions = {
        ["0.4.0"] = {
            revision = 2,
        },
    },
}
