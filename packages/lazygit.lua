return {
    schema = 2,
    name = "lazygit",
    description = "Manage Git repositories in a terminal",
    default_version = "0.65.1",
    homepage = "https://github.com/jesseduffield/lazygit",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "jesseduffield/lazygit",
        repository_id = 134017286,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "jesseduffield/lazygit",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "lazygit_{version}_linux_x86_64.tar.gz",
                ["aarch64-macos"] = "lazygit_{version}_darwin_arm64.tar.gz",
                ["aarch64-linux"] = "lazygit_{version}_linux_arm64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "lazygit" },
        checks = { { "lazygit", "--version" } },
    },
    versions = {
        ["0.65.1"] = {
            revision = 2,
        },
        ["0.65.0"] = {
            revision = 2,
        },
    },
}
