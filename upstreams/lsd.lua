return {
    ["name"] = "lsd",
    ["repository"] = "lsd-rs/lsd",
    ["repository_id"] = 158927812,
    ["description"] = "List directory contents",
    ["homepage"] = "https://github.com/lsd-rs/lsd",
    ["systems"] = {
        "aarch64-linux",
        "aarch64-macos",
        "x86_64-linux",
        "x86_64-macos",
    },
    ["assets"] = {
        ["aarch64-linux"] = "lsd-{tag}-aarch64-unknown-linux-musl.tar.gz",
        ["aarch64-macos"] = "lsd-{tag}-aarch64-apple-darwin.tar.gz",
        ["x86_64-linux"] = "lsd-{tag}-x86_64-unknown-linux-musl.tar.gz",
        ["x86_64-macos"] = "lsd-{tag}-x86_64-apple-darwin.tar.gz",
    },
    ["bins"] = {
        "lsd",
    },
    ["checks"] = {
        {
            "lsd",
            "--version",
        },
    },
}
