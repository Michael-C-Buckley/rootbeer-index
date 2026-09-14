return {
    name = "gitui",
    description = "Browse and manage Git repositories in the terminal",
    default_version = "0.28.1",
    source = {
        github = "extrawurst/gitui",
        tag = "v{version}",
        repository_id = 247725846,
        assets = {
            ["aarch64-linux"] = "gitui-linux-aarch64.tar.gz",
            ["aarch64-macos"] = "gitui-mac.tar.gz",
            ["x86_64-linux"] = "gitui-linux-x86_64.tar.gz",
            ["x86_64-macos"] = "gitui-mac-x86.tar.gz",
        },
    },
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux", "x86_64-macos" },
    bins = { "gitui" },
    checks = {
        { "gitui", "--version" },
    },
    versions = {
        ["0.28.1"] = {},
    },
}
