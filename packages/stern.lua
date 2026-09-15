return {
    schema = 2,
    name = "stern",
    description = "Follow logs from multiple Kubernetes pods",
    default_version = "1.34.0",
    homepage = "https://github.com/stern/stern",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "stern/stern",
        repository_id = 306013800,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "stern/stern",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "stern_{version}_linux_amd64.tar.gz",
                ["aarch64-macos"] = "stern_{version}_darwin_arm64.tar.gz",
                ["aarch64-linux"] = "stern_{version}_linux_arm64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "stern" },
        checks = { { "stern", "--version" } },
    },
    versions = {
        ["1.34.0"] = {
            revision = 2,
        },
    },
}
