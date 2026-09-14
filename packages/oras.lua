return {
    name = "oras",
    description = "Push and pull OCI registry artifacts",
    default_version = "1.3.4",
    source = {
        github = "oras-project/oras",
        tag = "v{version}",
        repository_id = 162945532,
        assets = {
            ["aarch64-linux"] = "oras_{version}_linux_arm64.tar.gz",
            ["aarch64-macos"] = "oras_{version}_darwin_arm64.tar.gz",
            ["x86_64-linux"] = "oras_{version}_linux_amd64.tar.gz",
            ["x86_64-macos"] = "oras_{version}_darwin_amd64.tar.gz",
        },
    },
    bins = { "oras" },
    checks = {
        { "oras", "version" },
        { "oras", "manifest", "--help" },
    },
    versions = {
        ["1.3.4"] = {},
    },
}
