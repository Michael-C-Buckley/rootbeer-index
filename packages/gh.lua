return {
    schema = 2,
    name = "gh",
    description = "Work with GitHub from the command line",
    default_version = "2.100.0",
    homepage = "https://github.com/cli/cli",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    upstream = {
        github = "cli/cli",
        repository_id = 212613049,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "cli/cli",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "gh_{version}_linux_amd64.tar.gz",
                ["aarch64-macos"] = "gh_{version}_macOS_arm64.zip",
                ["aarch64-linux"] = "gh_{version}_linux_arm64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "gh" },
        checks = { { "gh", "--version" } },
    },
    versions = {
        ["2.100.0"] = {
            revision = 2,
        },
    },
}
