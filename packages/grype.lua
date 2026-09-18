return {
    schema = 2,
    name = "grype",
    description = "Find vulnerabilities in images and filesystems",
    homepage = "https://github.com/anchore/grype",
    default_version = "0.119.0",
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
                ["aarch64-linux"] = "grype_{version}_linux_arm64.tar.gz",
                ["aarch64-macos"] = "grype_{version}_darwin_arm64.tar.gz",
                ["x86_64-linux"] = "grype_{version}_linux_amd64.tar.gz",
            },
        },
    },
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    outputs = {
        bins = { "grype" },
        checks = {
            { "grype", "version" },
        },
    },
    versions = {
        ["0.118.0"] = {
            revision = 2,
        },
        ["0.119.0"] = {},
    },
}
