return {
    name = "kind",
    description = "Run local Kubernetes clusters in containers",
    default_version = "0.33.0",
    source = {
        github = "kubernetes-sigs/kind",
        tag = "v{version}",
        repository_id = 148545807,
        assets = {
            ["aarch64-linux"] = "kind-linux-arm64",
            ["aarch64-macos"] = "kind-darwin-arm64",
            ["x86_64-linux"] = "kind-linux-amd64",
        },
    },
    bins = { "kind" },
    checks = {
        { "kind", "version" },
        { "kind", "create", "--help" },
    },
    versions = {
        ["0.33.0"] = { revision = 2 },
    },
}
