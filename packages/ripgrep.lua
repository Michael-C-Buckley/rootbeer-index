return {
    name = "ripgrep",
    aliases = { "rg" },
    description = "Search file contents with regular expressions",
    default_version = "15.2.0",
    source = {
        github = "BurntSushi/ripgrep",
        tag = "{version}",
        repository_id = 53631945,
        assets = {
            ["aarch64-linux"] = "ripgrep-{tag}-aarch64-unknown-linux-musl.tar.gz",
            ["aarch64-macos"] = "ripgrep-{tag}-aarch64-apple-darwin.tar.gz",
            ["x86_64-linux"] = "ripgrep-{tag}-x86_64-unknown-linux-musl.tar.gz",
        },
    },
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    bins = { "rg" },
    checks = {
        { "rg", "--version" },
    },
    versions = {
        ["15.2.0"] = {
            revision = 3,
        },
    },
}
