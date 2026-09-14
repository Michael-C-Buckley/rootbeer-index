return {
    name = "chezmoi",
    description = "Manage dotfiles across machines",
    default_version = "2.72.2",
    source = {
        github = "twpayne/chezmoi",
        tag = "v{version}",
        repository_id = 157245200,
        assets = {
            ["aarch64-linux"] = "chezmoi_{version}_linux_arm64.tar.gz",
            ["aarch64-macos"] = "chezmoi_{version}_darwin_arm64.tar.gz",
            ["x86_64-linux"] = "chezmoi_{version}_linux_amd64.tar.gz",
        },
    },
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    bins = { "chezmoi" },
    checks = {
        { "chezmoi", "--version" },
    },
    versions = {
        ["2.72.1"] = { revision = 2 },
        ["2.72.2"] = {
            revision = 2,
            systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
        },
    },
}
