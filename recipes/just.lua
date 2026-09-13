return {
    ["name"] = "just",
    ["aliases"] = {},
    ["description"] = "Run project commands",
    ["homepage"] = "https://just.systems",
    ["default_version"] = "1.58.0",
    ["versions"] = {
        ["1.58.0"] = {
            ["revision"] = 1,
            ["source"] = "github:casey/just@1.58.0",
            ["assets"] = {
                ["aarch64-linux"] = "just-1.58.0-aarch64-unknown-linux-musl.tar.gz",
                ["aarch64-macos"] = "just-1.58.0-aarch64-apple-darwin.tar.gz",
                ["x86_64-linux"] = "just-1.58.0-x86_64-unknown-linux-musl.tar.gz",
                ["x86_64-macos"] = "just-1.58.0-x86_64-apple-darwin.tar.gz",
            },
            ["systems"] = {
                "aarch64-linux",
                "aarch64-macos",
                "x86_64-linux",
                "x86_64-macos",
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
        },
    },
}
