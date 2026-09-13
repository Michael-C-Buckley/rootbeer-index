return {
    ["name"] = "lazygit",
    ["repository"] = "jesseduffield/lazygit",
    ["repository_id"] = 134017286,
    ["description"] = "Manage Git repositories in a terminal",
    ["homepage"] = "https://github.com/jesseduffield/lazygit",
    ["systems"] = {
        "aarch64-linux",
        "aarch64-macos",
        "x86_64-linux",
        "x86_64-macos",
    },
    ["assets"] = {
        ["aarch64-linux"] = "lazygit_{version}_linux_arm64.tar.gz",
        ["aarch64-macos"] = "lazygit_{version}_darwin_arm64.tar.gz",
        ["x86_64-linux"] = "lazygit_{version}_linux_x86_64.tar.gz",
        ["x86_64-macos"] = "lazygit_{version}_darwin_x86_64.tar.gz",
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
}
