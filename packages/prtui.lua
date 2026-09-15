return {
    schema = 2,
    name = "prtui",
    description = "Review GitHub pull requests in the terminal",
    default_version = "0.3.0",
    homepage = "https://github.com/tale/prtui",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "tale/prtui",
        repository_id = 1333872697,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "tale/prtui",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "prtui-{tag}-x86_64-unknown-linux-gnu.tar.gz",
                ["aarch64-macos"] = "prtui-{tag}-aarch64-apple-darwin.tar.gz",
                ["aarch64-linux"] = "prtui-{tag}-aarch64-unknown-linux-gnu.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "prtui" },
        checks = { { "prtui", "--version" }, { "prtui", "--help" } },
    },
    versions = {
        ["0.3.0"] = {
            revision = 2,
        },
    },
}
