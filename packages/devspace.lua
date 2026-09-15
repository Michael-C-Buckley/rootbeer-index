return {
    schema = 2,
    name = "devspace",
    description = "Develop applications in Kubernetes",
    default_version = "6.3.21",
    homepage = "https://github.com/devspace-sh/devspace",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "devspace-sh/devspace",
        repository_id = 145153231,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "devspace-sh/devspace",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "devspace-linux-amd64",
                ["aarch64-macos"] = "devspace-darwin-arm64",
                ["aarch64-linux"] = "devspace-linux-arm64",
            },
        },
    },
    outputs = {
        bins = { "devspace" },
        checks = { { "devspace", "version" } },
    },
    versions = {
        ["6.3.21"] = {
            revision = 2,
        },
    },
}
