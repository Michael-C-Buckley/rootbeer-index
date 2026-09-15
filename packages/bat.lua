return {
    schema = 2,
    name = "bat",
    description = "View files with syntax highlighting",
    default_version = "0.26.1",
    homepage = "https://github.com/sharkdp/bat",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "sharkdp/bat",
        repository_id = 130464961,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "sharkdp/bat",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "bat-{tag}-x86_64-unknown-linux-musl.tar.gz",
                ["aarch64-macos"] = "bat-{tag}-aarch64-apple-darwin.tar.gz",
                ["aarch64-linux"] = "bat-{tag}-aarch64-unknown-linux-musl.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "bat" },
        checks = { { "bat", "--version" }, { "bat", "--list-languages" } },
    },
    versions = {
        ["0.26.1"] = {
            revision = 2,
        },
    },
}
