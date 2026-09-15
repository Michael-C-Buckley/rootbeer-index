return {
    schema = 2,
    name = "minikube",
    description = "Run Kubernetes locally",
    default_version = "1.39.0",
    homepage = "https://github.com/kubernetes/minikube",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "kubernetes/minikube",
        repository_id = 56353740,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "kubernetes/minikube",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "minikube-linux-amd64",
                ["aarch64-macos"] = "minikube-darwin-arm64",
                ["aarch64-linux"] = "minikube-linux-arm64",
            },
        },
    },
    outputs = {
        bins = { "minikube" },
        checks = { { "minikube", "version" } },
    },
    versions = {
        ["1.39.0"] = {
            revision = 2,
        },
    },
}
