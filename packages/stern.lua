return {
    name = "stern",
    description = "Follow logs from multiple Kubernetes pods",
    default_version = "1.34.0",
    source = {
        github = "stern/stern",
        tag = "v{version}",
        repository_id = 306013800,
        assets = {
            ["aarch64-linux"] = "stern_{version}_linux_arm64.tar.gz",
            ["aarch64-macos"] = "stern_{version}_darwin_arm64.tar.gz",
            ["x86_64-linux"] = "stern_{version}_linux_amd64.tar.gz",
        },
    },
    bins = { "stern" },
    checks = {
        { "stern", "--version" },
    },
    versions = {
        ["1.34.0"] = { revision = 2 },
    },
}
