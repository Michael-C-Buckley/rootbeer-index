return {
    name = "prtui",
    description = "Review GitHub pull requests in the terminal",
    default_version = "0.3.0",
    source = {
        github = "tale/prtui",
        tag = "v{version}",
        repository_id = 1333872697,
        assets = {
            ["aarch64-macos"] = "prtui-{tag}-aarch64-apple-darwin.tar.gz",
            ["x86_64-macos"] = "prtui-{tag}-x86_64-apple-darwin.tar.gz",
            ["aarch64-linux"] = "prtui-{tag}-aarch64-unknown-linux-gnu.tar.gz",
            ["x86_64-linux"] = "prtui-{tag}-x86_64-unknown-linux-gnu.tar.gz",
        },
    },
    bins = { "prtui" },
    checks = {
        { "prtui", "--version" },
        { "prtui", "--help" },
    },
    versions = {
        ["0.3.0"] = {},
    },
}
