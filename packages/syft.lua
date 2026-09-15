return {
    schema = 2,
    name = "syft",
    description = "Generate software bills of materials",
    default_version = "1.51.1",
    homepage = "https://github.com/anchore/syft",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "anchore/syft",
        repository_id = 262126497,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "anchore/syft",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "syft_{version}_linux_amd64.tar.gz",
                ["aarch64-macos"] = "syft_{version}_darwin_arm64.tar.gz",
                ["aarch64-linux"] = "syft_{version}_linux_arm64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "syft" },
        checks = { { "syft", "version" } },
    },
    versions = {
        ["1.51.1"] = {
            revision = 2,
        },
    },
}
