return {
    schema = 2,
    name = "kind",
    description = "Run local Kubernetes clusters in containers",
    default_version = "0.33.0",
    homepage = "https://github.com/kubernetes-sigs/kind",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "kubernetes-sigs/kind",
        repository_id = 148545807,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "kubernetes-sigs/kind",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "kind-linux-amd64",
                ["aarch64-macos"] = "kind-darwin-arm64",
                ["aarch64-linux"] = "kind-linux-arm64",
            },
        },
    },
    outputs = {
        bins = { "kind" },
        checks = { { "kind", "version" }, { "kind", "create", "--help" } },
    },
    versions = {
        ["0.33.0"] = {
            revision = 2,
        },
    },
}
