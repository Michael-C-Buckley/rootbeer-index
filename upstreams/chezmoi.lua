return {
    ["name"] = "chezmoi",
    ["repository"] = "twpayne/chezmoi",
    ["repository_id"] = 157245200,
    ["description"] = "Manage dotfiles across machines",
    ["homepage"] = "https://github.com/twpayne/chezmoi",
    ["systems"] = {
        "aarch64-linux",
        "aarch64-macos",
        "x86_64-linux",
        "x86_64-macos",
    },
    ["assets"] = {
        ["aarch64-linux"] = "chezmoi_{version}_linux_arm64.tar.gz",
        ["aarch64-macos"] = "chezmoi_{version}_darwin_arm64.tar.gz",
        ["x86_64-linux"] = "chezmoi_{version}_linux_amd64.tar.gz",
        ["x86_64-macos"] = "chezmoi_{version}_darwin_amd64.tar.gz",
    },
    ["bins"] = {
        "chezmoi",
    },
    ["checks"] = {
        {
            "chezmoi",
            "--version",
        },
    },
}
