return {
    upstream = {
        provider = "github",
        repository = "jesseduffield/lazygit",
        repository_id = 134017286,
        assets = {
            ["aarch64-linux"] = "lazygit_{version}_linux_arm64.tar.gz",
            ["aarch64-macos"] = "lazygit_{version}_darwin_arm64.tar.gz",
            ["x86_64-linux"] = "lazygit_{version}_linux_x86_64.tar.gz",
            ["x86_64-macos"] = "lazygit_{version}_darwin_x86_64.tar.gz",
        },
    },
    ["name"] = "lazygit",
    ["aliases"] = {},
    ["description"] = "Manage Git repositories in a terminal",
    ["homepage"] = "https://github.com/jesseduffield/lazygit",
    ["default_version"] = "0.65.0",
    ["versions"] = {
        ["0.65.0"] = {
            ["revision"] = 1,
            ["source"] = "github:jesseduffield/lazygit@v0.65.0",
            ["assets"] = {
                ["aarch64-linux"] = "lazygit_0.65.0_linux_arm64.tar.gz",
                ["aarch64-macos"] = "lazygit_0.65.0_darwin_arm64.tar.gz",
                ["x86_64-linux"] = "lazygit_0.65.0_linux_x86_64.tar.gz",
                ["x86_64-macos"] = "lazygit_0.65.0_darwin_x86_64.tar.gz",
            },
            ["systems"] = {
                "aarch64-linux",
                "aarch64-macos",
                "x86_64-linux",
                "x86_64-macos",
            },
            ["bins"] = {
                "lazygit",
            },
            ["checks"] = {
                {
                    "lazygit",
                    "--version",
                },
            },
        },
    },
}
