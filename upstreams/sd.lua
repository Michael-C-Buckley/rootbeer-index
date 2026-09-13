return {
    ["name"] = "sd",
    ["repository"] = "chmln/sd",
    ["repository_id"] = 162863623,
    ["description"] = "Find and replace text",
    ["homepage"] = "https://github.com/chmln/sd",
    ["systems"] = {
        "aarch64-linux",
        "aarch64-macos",
        "x86_64-linux",
        "x86_64-macos",
    },
    ["assets"] = {
        ["aarch64-linux"] = "sd-{tag}-aarch64-unknown-linux-musl.tar.gz",
        ["aarch64-macos"] = "sd-{tag}-aarch64-apple-darwin.tar.gz",
        ["x86_64-linux"] = "sd-{tag}-x86_64-unknown-linux-musl.tar.gz",
        ["x86_64-macos"] = "sd-{tag}-x86_64-apple-darwin.tar.gz",
    },
    ["bins"] = {
        "sd",
    },
    ["checks"] = {
        {
            "sd",
            "--version",
        },
    },
}
