return {
    schema = 2,
    name = "watchexec",
    description = "Run commands when files change",
    homepage = "https://github.com/watchexec/watchexec",
    default_version = "2.7.3",
    upstream = {
        github = "watchexec/watchexec",
        repository_id = 68546136,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "watchexec/watchexec",
            tag = "v{version}",
            assets = {
                ["aarch64-linux"] = "watchexec-{version}-aarch64-unknown-linux-musl.tar.xz",
                ["aarch64-macos"] = "watchexec-{version}-aarch64-apple-darwin.tar.xz",
                ["x86_64-linux"] = "watchexec-{version}-x86_64-unknown-linux-musl.tar.xz",
            },
        },
    },
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    outputs = {
        bins = { "watchexec" },
        checks = {
            { "watchexec", "--version" },
            { "watchexec", "--help" },
        },
    },
    versions = {
        ["2.7.2"] = {
            revision = 2,
        },
        ["2.7.3"] = {},
    },
}
