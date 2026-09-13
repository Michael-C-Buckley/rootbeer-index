return {
    ["name"] = "hyperfine",
    ["repository"] = "sharkdp/hyperfine",
    ["repository_id"] = 117356231,
    ["description"] = "Benchmark command execution",
    ["homepage"] = "https://github.com/sharkdp/hyperfine",
    ["systems"] = {
        "aarch64-linux",
        "aarch64-macos",
        "x86_64-linux",
        "x86_64-macos",
    },
    ["assets"] = {
        ["aarch64-linux"] = "hyperfine-{tag}-aarch64-unknown-linux-gnu.tar.gz",
        ["aarch64-macos"] = "hyperfine-{tag}-aarch64-apple-darwin.tar.gz",
        ["x86_64-linux"] = "hyperfine-{tag}-x86_64-unknown-linux-musl.tar.gz",
        ["x86_64-macos"] = "hyperfine-{tag}-x86_64-apple-darwin.tar.gz",
    },
    ["bins"] = {
        "hyperfine",
    },
    ["checks"] = {
        {
            "hyperfine",
            "--version",
        },
    },
}
