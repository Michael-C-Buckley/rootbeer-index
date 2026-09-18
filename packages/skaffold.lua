return {
    schema = 2,
    name = "skaffold",
    description = "Build and deploy applications during Kubernetes development",
    homepage = "https://github.com/GoogleContainerTools/skaffold",
    default_version = "2.25.0",
    upstream = {
        github = "GoogleContainerTools/skaffold",
        repository_id = 118654121,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "GoogleContainerTools/skaffold",
            tag = "v{version}",
            assets = {
                ["aarch64-linux"] = "skaffold-linux-arm64",
                ["aarch64-macos"] = "skaffold-darwin-arm64",
                ["x86_64-linux"] = "skaffold-linux-amd64",
            },
        },
    },
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    outputs = {
        bins = { "skaffold" },
        checks = {
            { "skaffold", "version" },
        },
    },
    versions = {
        ["2.24.0"] = {
            revision = 2,
        },
        ["2.25.0"] = {},
    },
}
