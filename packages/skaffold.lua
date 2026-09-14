return {
    name = "skaffold",
    description = "Build and deploy applications during Kubernetes development",
    default_version = "2.24.0",
    source = {
        github = "GoogleContainerTools/skaffold",
        tag = "v{version}",
        repository_id = 118654121,
        assets = {
            ["aarch64-linux"] = "skaffold-linux-arm64",
            ["aarch64-macos"] = "skaffold-darwin-arm64",
            ["x86_64-linux"] = "skaffold-linux-amd64",
            ["x86_64-macos"] = "skaffold-darwin-amd64",
        },
    },
    bins = { "skaffold" },
    checks = {
        { "skaffold", "version" },
    },
    versions = {
        ["2.24.0"] = {},
    },
}
