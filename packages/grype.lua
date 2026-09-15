return {
    schema = 2,
    name = "grype",
    description = "Find vulnerabilities in images and filesystems",
    default_version = "0.118.0",
    homepage = "https://github.com/anchore/grype",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "anchore/grype",
        repository_id = 267054247,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "anchore/grype",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "grype_{version}_linux_amd64.tar.gz",
                ["aarch64-macos"] = "grype_{version}_darwin_arm64.tar.gz",
                ["aarch64-linux"] = "grype_{version}_linux_arm64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "grype" },
        checks = { { "grype", "version" } },
    },
    versions = {
        ["0.118.0"] = {
            revision = 2,
        },
    },
}
