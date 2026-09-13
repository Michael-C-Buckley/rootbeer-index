return {
    upstream = {
        provider = "github",
        repository = "sharkdp/hyperfine",
        repository_id = 117356231,
        assets = {
            ["aarch64-linux"] = "hyperfine-{tag}-aarch64-unknown-linux-gnu.tar.gz",
            ["aarch64-macos"] = "hyperfine-{tag}-aarch64-apple-darwin.tar.gz",
            ["x86_64-linux"] = "hyperfine-{tag}-x86_64-unknown-linux-musl.tar.gz",
            ["x86_64-macos"] = "hyperfine-{tag}-x86_64-apple-darwin.tar.gz",
        },
    },
    ["name"] = "hyperfine",
    ["aliases"] = {},
    ["description"] = "Benchmark command execution",
    ["homepage"] = "https://github.com/sharkdp/hyperfine",
    ["default_version"] = "1.20.0",
    ["versions"] = {
        ["1.20.0"] = {
            ["revision"] = 1,
            ["source"] = "github:sharkdp/hyperfine@v1.20.0",
            ["assets"] = {
                ["aarch64-linux"] = "hyperfine-v1.20.0-aarch64-unknown-linux-gnu.tar.gz",
                ["aarch64-macos"] = "hyperfine-v1.20.0-aarch64-apple-darwin.tar.gz",
                ["x86_64-linux"] = "hyperfine-v1.20.0-x86_64-unknown-linux-musl.tar.gz",
                ["x86_64-macos"] = "hyperfine-v1.20.0-x86_64-apple-darwin.tar.gz",
            },
            ["systems"] = {
                "aarch64-linux",
                "aarch64-macos",
                "x86_64-linux",
                "x86_64-macos",
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
        },
    },
}
