return {
    ["name"] = "bat",
    ["repository"] = "sharkdp/bat",
    ["repository_id"] = 130464961,
    ["description"] = "View files with syntax highlighting",
    ["homepage"] = "https://github.com/sharkdp/bat",
    ["systems"] = {
        "aarch64-linux",
        "aarch64-macos",
        "x86_64-linux",
        "x86_64-macos",
    },
    ["assets"] = {
        ["aarch64-linux"] = "bat-{tag}-aarch64-unknown-linux-musl.tar.gz",
        ["aarch64-macos"] = "bat-{tag}-aarch64-apple-darwin.tar.gz",
        ["x86_64-linux"] = "bat-{tag}-x86_64-unknown-linux-musl.tar.gz",
        ["x86_64-macos"] = "bat-{tag}-x86_64-apple-darwin.tar.gz",
    },
    ["bins"] = {
        "bat",
    },
    ["checks"] = {
        {
            "bat",
            "--version",
        },
        {
            "bat",
            "--list-languages",
        },
    },
}
