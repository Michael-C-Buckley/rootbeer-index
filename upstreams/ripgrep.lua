return {
    ["name"] = "ripgrep",
    ["repository"] = "BurntSushi/ripgrep",
    ["repository_id"] = 53631945,
    ["aliases"] = {
        "rg",
    },
    ["description"] = "Search file contents with regular expressions",
    ["homepage"] = "https://github.com/BurntSushi/ripgrep",
    ["systems"] = {
        "aarch64-linux",
        "aarch64-macos",
        "x86_64-linux",
        "x86_64-macos",
    },
    ["assets"] = {
        ["aarch64-linux"] = "ripgrep-{tag}-aarch64-unknown-linux-musl.tar.gz",
        ["aarch64-macos"] = "ripgrep-{tag}-aarch64-apple-darwin.tar.gz",
        ["x86_64-linux"] = "ripgrep-{tag}-x86_64-unknown-linux-musl.tar.gz",
        ["x86_64-macos"] = "ripgrep-{tag}-x86_64-apple-darwin.tar.gz",
    },
    ["bins"] = {
        "rg",
    },
    ["checks"] = {
        {
            "rg",
            "--version",
        },
    },
}
