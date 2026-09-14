return {
    name = "grex",
    description = "Generate regular expressions from examples",
    default_version = "1.4.6",
    source = {
        github = "pemistahl/grex",
        tag = "v{version}",
        repository_id = 213043312,
        assets = {
            ["aarch64-linux"] = "grex-{tag}-aarch64-unknown-linux-musl.tar.gz",
            ["aarch64-macos"] = "grex-{tag}-aarch64-apple-darwin.tar.gz",
            ["x86_64-linux"] = "grex-{tag}-x86_64-unknown-linux-musl.tar.gz",
            ["x86_64-macos"] = "grex-{tag}-x86_64-apple-darwin.tar.gz",
        },
    },
    bins = { "grex" },
    checks = {
        { "grex", "--version" },
        { "grex", "abc", "abd" },
    },
    versions = {
        ["1.4.6"] = {},
    },
}
