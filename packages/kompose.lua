return {
    name = "kompose",
    description = "Convert Docker Compose files to Kubernetes resources",
    default_version = "1.38.0",
    source = {
        github = "kubernetes/kompose",
        tag = "v{version}",
        repository_id = 62088377,
        assets = {
            ["aarch64-linux"] = "kompose-linux-arm64",
            ["aarch64-macos"] = "kompose-darwin-arm64",
            ["x86_64-linux"] = "kompose-linux-amd64",
        },
    },
    bins = { "kompose" },
    checks = {
        { "kompose", "version" },
        { "kompose", "convert", "--help" },
    },
    versions = {
        ["1.38.0"] = { revision = 2 },
    },
}
