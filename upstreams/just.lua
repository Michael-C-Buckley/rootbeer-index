return {
    ["name"] = "just",
    ["repository"] = "casey/just",
    ["repository_id"] = 61349723,
    ["description"] = "Run project commands",
    ["homepage"] = "https://just.systems",
    ["systems"] = {
        "aarch64-linux",
        "aarch64-macos",
        "x86_64-linux",
        "x86_64-macos",
    },
    ["assets"] = {
        ["aarch64-linux"] = "just-{tag}-aarch64-unknown-linux-musl.tar.gz",
        ["aarch64-macos"] = "just-{tag}-aarch64-apple-darwin.tar.gz",
        ["x86_64-linux"] = "just-{tag}-x86_64-unknown-linux-musl.tar.gz",
        ["x86_64-macos"] = "just-{tag}-x86_64-apple-darwin.tar.gz",
    },
    ["bins"] = {
        "just",
    },
    ["checks"] = {
        {
            "just",
            "--version",
        },
    },
}
