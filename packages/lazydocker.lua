return {
    schema = 2,
    name = "lazydocker",
    description = "Manage Docker containers in a terminal interface",
    default_version = "0.25.2",
    homepage = "https://github.com/jesseduffield/lazydocker",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "jesseduffield/lazydocker",
        repository_id = 187335810,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "jesseduffield/lazydocker",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "lazydocker_{version}_Linux_x86_64.tar.gz",
                ["aarch64-macos"] = "lazydocker_{version}_Darwin_arm64.tar.gz",
                ["aarch64-linux"] = "lazydocker_{version}_Linux_arm64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "lazydocker" },
        checks = { { "lazydocker", "--version" } },
    },
    versions = {
        ["0.25.2"] = {
            revision = 2,
        },
    },
}
