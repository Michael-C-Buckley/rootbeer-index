return {
    schema = 2,
    name = "kompose",
    description = "Convert Docker Compose files to Kubernetes resources",
    default_version = "1.38.0",
    homepage = "https://github.com/kubernetes/kompose",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "kubernetes/kompose",
        repository_id = 62088377,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "kubernetes/kompose",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "kompose-linux-amd64",
                ["aarch64-macos"] = "kompose-darwin-arm64",
                ["aarch64-linux"] = "kompose-linux-arm64",
            },
        },
    },
    outputs = {
        bins = { "kompose" },
        checks = { { "kompose", "version" }, { "kompose", "convert", "--help" } },
    },
    versions = {
        ["1.38.0"] = {
            revision = 2,
        },
    },
}
