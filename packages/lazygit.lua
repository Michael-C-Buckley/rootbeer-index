return {
    name = "lazygit",
    description = "Manage Git repositories in a terminal",
    default_version = "0.65.1",
    source = {
        github = "jesseduffield/lazygit",
        tag = "v{version}",
        repository_id = 134017286,
        assets = {
            ["aarch64-linux"] = "lazygit_{version}_linux_arm64.tar.gz",
            ["aarch64-macos"] = "lazygit_{version}_darwin_arm64.tar.gz",
            ["x86_64-linux"] = "lazygit_{version}_linux_x86_64.tar.gz",
        },
    },
    bins = { "lazygit" },
    checks = {
        { "lazygit", "--version" },
    },
    versions = {
        ["0.65.0"] = { revision = 2 },
        ["0.65.1"] = { revision = 2 },
    },
}
