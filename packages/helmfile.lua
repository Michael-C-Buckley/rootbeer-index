return {
    name = "helmfile",
    description = "Manage Helm releases from configuration files",
    default_version = "1.8.0",
    source = {
        github = "helmfile/helmfile",
        tag = "v{version}",
        repository_id = 474521466,
        assets = {
            ["aarch64-linux"] = "helmfile_{version}_linux_arm64.tar.gz",
            ["aarch64-macos"] = "helmfile_{version}_darwin_arm64.tar.gz",
            ["x86_64-linux"] = "helmfile_{version}_linux_amd64.tar.gz",
            ["x86_64-macos"] = "helmfile_{version}_darwin_amd64.tar.gz",
        },
    },
    bins = { "helmfile" },
    checks = {
        { "helmfile", "--version" },
        { "helmfile", "build", "--help" },
    },
    versions = {
        ["1.8.0"] = {},
    },
}
