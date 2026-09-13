return {
    ["name"] = "zoxide",
    ["repository"] = "ajeetdsouza/zoxide",
    ["repository_id"] = 245166720,
    ["description"] = "Navigate frequently used directories",
    ["homepage"] = "https://crates.io/crates/zoxide",
    ["systems"] = {
        "aarch64-linux",
        "aarch64-macos",
        "x86_64-linux",
        "x86_64-macos",
    },
    ["assets"] = {
        ["aarch64-linux"] = "zoxide-{version}-aarch64-unknown-linux-musl.tar.gz",
        ["aarch64-macos"] = "zoxide-{version}-aarch64-apple-darwin.tar.gz",
        ["x86_64-linux"] = "zoxide-{version}-x86_64-unknown-linux-musl.tar.gz",
        ["x86_64-macos"] = "zoxide-{version}-x86_64-apple-darwin.tar.gz",
    },
    ["bins"] = {
        "zoxide",
    },
    ["checks"] = {
        {
            "zoxide",
            "--version",
        },
        {
            "zoxide",
            "init",
            "zsh",
        },
    },
}
