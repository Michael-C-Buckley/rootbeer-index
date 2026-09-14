return {
    name = "watchexec",
    description = "Run commands when files change",
    default_version = "2.7.2",
    source = {
        github = "watchexec/watchexec",
        tag = "v{version}",
        repository_id = 68546136,
        assets = {
            ["aarch64-linux"] = "watchexec-{version}-aarch64-unknown-linux-musl.tar.xz",
            ["aarch64-macos"] = "watchexec-{version}-aarch64-apple-darwin.tar.xz",
            ["x86_64-linux"] = "watchexec-{version}-x86_64-unknown-linux-musl.tar.xz",
            ["x86_64-macos"] = "watchexec-{version}-x86_64-apple-darwin.tar.xz",
        },
    },
    bins = { "watchexec" },
    checks = {
        { "watchexec", "--version" },
        { "watchexec", "--help" },
    },
    versions = {
        ["2.7.2"] = {},
    },
}
