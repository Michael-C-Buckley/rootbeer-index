return {
    ["name"] = "bat",
    ["aliases"] = {},
    ["description"] = "View files with syntax highlighting",
    ["homepage"] = "https://github.com/sharkdp/bat",
    ["default_version"] = "0.26.1",
    ["versions"] = {
        ["0.26.1"] = {
            ["revision"] = 1,
            ["source"] = "github:sharkdp/bat@v0.26.1",
            ["assets"] = {
                ["aarch64-linux"] = "bat-v0.26.1-aarch64-unknown-linux-musl.tar.gz",
                ["aarch64-macos"] = "bat-v0.26.1-aarch64-apple-darwin.tar.gz",
                ["x86_64-linux"] = "bat-v0.26.1-x86_64-unknown-linux-musl.tar.gz",
                ["x86_64-macos"] = "bat-v0.26.1-x86_64-apple-darwin.tar.gz",
            },
            ["systems"] = {
                "aarch64-linux",
                "aarch64-macos",
                "x86_64-linux",
                "x86_64-macos",
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
        },
    },
}
