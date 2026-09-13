return {
    ["name"] = "fd",
    ["repository"] = "sharkdp/fd",
    ["repository_id"] = 90793418,
    ["description"] = "Find files by name",
    ["homepage"] = "https://github.com/sharkdp/fd",
    ["systems"] = {
        "aarch64-linux",
        "aarch64-macos",
        "x86_64-linux",
        "x86_64-macos",
    },
    ["assets"] = {
        ["aarch64-linux"] = "fd-{tag}-aarch64-unknown-linux-musl.tar.gz",
        ["aarch64-macos"] = "fd-{tag}-aarch64-apple-darwin.tar.gz",
        ["x86_64-linux"] = "fd-{tag}-x86_64-unknown-linux-musl.tar.gz",
        ["x86_64-macos"] = "fd-{tag}-x86_64-apple-darwin.tar.gz",
    },
    ["bins"] = {
        "fd",
    },
    ["checks"] = {
        {
            "fd",
            "--version",
        },
    },
}
