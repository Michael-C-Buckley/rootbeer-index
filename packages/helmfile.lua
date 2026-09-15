return {
    schema = 2,
    name = "helmfile",
    description = "Manage Helm releases from configuration files",
    default_version = "1.8.0",
    homepage = "https://github.com/helmfile/helmfile",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "helmfile/helmfile",
        repository_id = 474521466,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "helmfile/helmfile",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "helmfile_{version}_linux_amd64.tar.gz",
                ["aarch64-macos"] = "helmfile_{version}_darwin_arm64.tar.gz",
                ["aarch64-linux"] = "helmfile_{version}_linux_arm64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "helmfile" },
        checks = { { "helmfile", "--version" }, { "helmfile", "build", "--help" } },
    },
    versions = {
        ["1.8.0"] = {
            revision = 2,
        },
    },
}
