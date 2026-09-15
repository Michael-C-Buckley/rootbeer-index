return {
    schema = 2,
    name = "k9s",
    description = "Manage Kubernetes clusters in a terminal interface",
    default_version = "0.51.0",
    homepage = "https://github.com/derailed/k9s",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "derailed/k9s",
        repository_id = 167596393,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "derailed/k9s",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "k9s_Linux_amd64.tar.gz",
                ["aarch64-macos"] = "k9s_Darwin_arm64.tar.gz",
                ["aarch64-linux"] = "k9s_Linux_arm64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "k9s" },
        checks = { { "k9s", "version" } },
    },
    versions = {
        ["0.51.0"] = {
            revision = 2,
        },
    },
}
