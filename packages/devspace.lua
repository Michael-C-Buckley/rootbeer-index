return {
    name = "devspace",
    description = "Develop applications in Kubernetes",
    default_version = "6.3.21",
    source = {
        github = "devspace-sh/devspace",
        tag = "v{version}",
        repository_id = 145153231,
        assets = {
            ["aarch64-linux"] = "devspace-linux-arm64",
            ["aarch64-macos"] = "devspace-darwin-arm64",
            ["x86_64-linux"] = "devspace-linux-amd64",
        },
    },
    bins = { "devspace" },
    checks = {
        { "devspace", "version" },
    },
    versions = {
        ["6.3.21"] = { revision = 2 },
    },
}
