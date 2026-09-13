return {
    name = "zoxide",
    description = "Navigate frequently used directories",
    homepage = "https://crates.io/crates/zoxide",
    default_version = "0.10.0",
    source = {
        github = "ajeetdsouza/zoxide",
        tag = "v{version}",
        repository_id = 245166720,
        assets = {
            ["aarch64-linux"] = "zoxide-{version}-aarch64-unknown-linux-musl.tar.gz",
            ["aarch64-macos"] = "zoxide-{version}-aarch64-apple-darwin.tar.gz",
            ["x86_64-linux"] = "zoxide-{version}-x86_64-unknown-linux-musl.tar.gz",
            ["x86_64-macos"] = "zoxide-{version}-x86_64-apple-darwin.tar.gz",
        },
    },
    bins = { "zoxide" },
    checks = {
        { "zoxide", "--version" },
        { "zoxide", "init", "zsh" },
    },
    versions = {
        ["0.10.0"] = {},
    },
}
