return {
    name = "grype",
    description = "Find vulnerabilities in images and filesystems",
    default_version = "0.118.0",
    source = {
        github = "anchore/grype",
        tag = "v{version}",
        repository_id = 267054247,
        assets = {
            ["aarch64-linux"] = "grype_{version}_linux_arm64.tar.gz",
            ["aarch64-macos"] = "grype_{version}_darwin_arm64.tar.gz",
            ["x86_64-linux"] = "grype_{version}_linux_amd64.tar.gz",
            ["x86_64-macos"] = "grype_{version}_darwin_amd64.tar.gz",
        },
    },
    bins = { "grype" },
    checks = {
        { "grype", "version" },
    },
    versions = {
        ["0.118.0"] = {},
    },
}
