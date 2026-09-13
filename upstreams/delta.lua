return {
    ["name"] = "delta",
    ["repository"] = "dandavison/delta",
    ["repository_id"] = 193526915,
    ["description"] = "Display readable diffs",
    ["homepage"] = "https://github.com/dandavison/delta",
    ["systems"] = {
        "aarch64-linux",
        "aarch64-macos",
        "x86_64-linux",
        "x86_64-macos",
    },
    ["assets"] = {
        ["aarch64-linux"] = "delta-{tag}-aarch64-unknown-linux-gnu.tar.gz",
        ["aarch64-macos"] = "delta-{tag}-aarch64-apple-darwin.tar.gz",
        ["x86_64-linux"] = "delta-{tag}-x86_64-unknown-linux-musl.tar.gz",
        ["x86_64-macos"] = "delta-{tag}-x86_64-apple-darwin.tar.gz",
    },
    ["bins"] = {
        "delta",
    },
    ["checks"] = {
        {
            "delta",
            "--version",
        },
    },
}
