return {
    name = "syft",
    description = "Generate software bills of materials",
    default_version = "1.51.1",
    source = {
        github = "anchore/syft",
        tag = "v{version}",
        repository_id = 262126497,
        assets = {
            ["aarch64-linux"] = "syft_{version}_linux_arm64.tar.gz",
            ["aarch64-macos"] = "syft_{version}_darwin_arm64.tar.gz",
            ["x86_64-linux"] = "syft_{version}_linux_amd64.tar.gz",
        },
    },
    bins = { "syft" },
    checks = {
        { "syft", "version" },
    },
    versions = {
        ["1.51.1"] = { revision = 2 },
    },
}
