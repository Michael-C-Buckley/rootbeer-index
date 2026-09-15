return {
    schema = 2,
    name = "gitui",
    description = "Browse and manage Git repositories in the terminal",
    default_version = "0.28.1",
    homepage = "https://github.com/gitui-org/gitui",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "gitui-org/gitui",
        repository_id = 247725846,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "gitui-org/gitui",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "gitui-linux-x86_64.tar.gz",
                ["aarch64-macos"] = "gitui-mac.tar.gz",
                ["aarch64-linux"] = "gitui-linux-aarch64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "gitui" },
        checks = { { "gitui", "--version" } },
    },
    versions = {
        ["0.28.1"] = {
            revision = 3,
        },
    },
}
