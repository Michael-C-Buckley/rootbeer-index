return {
    name = "minikube",
    description = "Run Kubernetes locally",
    default_version = "1.39.0",
    source = {
        github = "kubernetes/minikube",
        tag = "v{version}",
        repository_id = 56353740,
        assets = {
            ["aarch64-linux"] = "minikube-linux-arm64",
            ["aarch64-macos"] = "minikube-darwin-arm64",
            ["x86_64-linux"] = "minikube-linux-amd64",
            ["x86_64-macos"] = "minikube-darwin-amd64",
        },
    },
    bins = { "minikube" },
    checks = {
        { "minikube", "version" },
    },
    versions = {
        ["1.39.0"] = {},
    },
}
