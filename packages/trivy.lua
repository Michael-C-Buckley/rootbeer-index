return {
    name = "trivy",
    description = "Find vulnerabilities and configuration issues",
    default_version = "0.74.0",
    source = {
        github = "aquasecurity/trivy",
        tag = "v{version}",
        repository_id = 180687624,
        assets = {
            ["aarch64-linux"] = "trivy_{version}_Linux-ARM64.tar.gz",
            ["aarch64-macos"] = "trivy_{version}_macOS-ARM64.tar.gz",
            ["x86_64-linux"] = "trivy_{version}_Linux-64bit.tar.gz",
            ["x86_64-macos"] = "trivy_{version}_macOS-64bit.tar.gz",
        },
    },
    bins = { "trivy" },
    checks = {
        { "trivy", "--version" },
        { "trivy", "filesystem", "--help" },
    },
    versions = {
        ["0.74.0"] = {},
    },
}
