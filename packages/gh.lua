return {
    name = "gh",
    description = "Work with GitHub from the command line",
    default_version = "2.100.0",
    source = {
        github = "cli/cli",
        tag = "v{version}",
        repository_id = 212613049,
        assets = {
            ["aarch64-linux"] = "gh_{version}_linux_arm64.tar.gz",
            ["aarch64-macos"] = "gh_{version}_macOS_arm64.zip",
            ["x86_64-linux"] = "gh_{version}_linux_amd64.tar.gz",
        },
    },
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    bins = { "gh" },
    checks = {
        { "gh", "--version" },
    },
    versions = {
        ["2.100.0"] = { revision = 2 },
    },
}
