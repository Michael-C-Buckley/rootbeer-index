return {
    name = "k9s",
    description = "Manage Kubernetes clusters in a terminal interface",
    default_version = "0.51.0",
    source = {
        github = "derailed/k9s",
        tag = "v{version}",
        repository_id = 167596393,
        assets = {
            ["aarch64-linux"] = "k9s_Linux_arm64.tar.gz",
            ["aarch64-macos"] = "k9s_Darwin_arm64.tar.gz",
            ["x86_64-linux"] = "k9s_Linux_amd64.tar.gz",
            ["x86_64-macos"] = "k9s_Darwin_amd64.tar.gz",
        },
    },
    bins = { "k9s" },
    checks = {
        { "k9s", "version" },
    },
    versions = {
        ["0.51.0"] = {},
    },
}
