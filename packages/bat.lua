return {
    name = "bat",
    description = "View files with syntax highlighting",
    default_version = "0.26.1",
    source = {
        github = "sharkdp/bat",
        tag = "v{version}",
        repository_id = 130464961,
        assets = {
            ["aarch64-linux"] = "bat-{tag}-aarch64-unknown-linux-musl.tar.gz",
            ["aarch64-macos"] = "bat-{tag}-aarch64-apple-darwin.tar.gz",
            ["x86_64-linux"] = "bat-{tag}-x86_64-unknown-linux-musl.tar.gz",
            ["x86_64-macos"] = "bat-{tag}-x86_64-apple-darwin.tar.gz",
        },
    },
    bins = { "bat" },
    checks = {
        { "bat", "--version" },
        { "bat", "--list-languages" },
    },
    versions = {
        ["0.26.1"] = {},
    },
}
