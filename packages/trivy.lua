return {
    schema = 2,
    name = "trivy",
    description = "Find vulnerabilities and configuration issues",
    default_version = "0.74.0",
    homepage = "https://github.com/aquasecurity/trivy",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "aquasecurity/trivy",
        repository_id = 180687624,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "aquasecurity/trivy",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "trivy_{version}_Linux-64bit.tar.gz",
                ["aarch64-macos"] = "trivy_{version}_macOS-ARM64.tar.gz",
                ["aarch64-linux"] = "trivy_{version}_Linux-ARM64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "trivy" },
        checks = { { "trivy", "--version" }, { "trivy", "filesystem", "--help" } },
    },
    versions = {
        ["0.74.0"] = {
            revision = 2,
        },
    },
}
