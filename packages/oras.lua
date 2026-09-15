return {
    schema = 2,
    name = "oras",
    description = "Push and pull OCI registry artifacts",
    default_version = "1.3.4",
    homepage = "https://github.com/oras-project/oras",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "oras-project/oras",
        repository_id = 162945532,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "oras-project/oras",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "oras_{version}_linux_amd64.tar.gz",
                ["aarch64-macos"] = "oras_{version}_darwin_arm64.tar.gz",
                ["aarch64-linux"] = "oras_{version}_linux_arm64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "oras" },
        checks = { { "oras", "version" }, { "oras", "manifest", "--help" } },
    },
    versions = {
        ["1.3.4"] = {
            revision = 2,
        },
    },
}
