return {
    name = "lazydocker",
    description = "Manage Docker containers in a terminal interface",
    default_version = "0.25.2",
    source = {
        github = "jesseduffield/lazydocker",
        tag = "v{version}",
        repository_id = 187335810,
        assets = {
            ["aarch64-linux"] = "lazydocker_{version}_Linux_arm64.tar.gz",
            ["aarch64-macos"] = "lazydocker_{version}_Darwin_arm64.tar.gz",
            ["x86_64-linux"] = "lazydocker_{version}_Linux_x86_64.tar.gz",
        },
    },
    bins = { "lazydocker" },
    checks = {
        { "lazydocker", "--version" },
    },
    versions = {
        ["0.25.2"] = { revision = 2 },
    },
}
