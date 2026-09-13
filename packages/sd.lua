return {
    upstream = {
        provider = "github",
        repository = "chmln/sd",
        repository_id = 162863623,
        assets = {
            ["aarch64-linux"] = "sd-{tag}-aarch64-unknown-linux-musl.tar.gz",
            ["aarch64-macos"] = "sd-{tag}-aarch64-apple-darwin.tar.gz",
            ["x86_64-linux"] = "sd-{tag}-x86_64-unknown-linux-musl.tar.gz",
            ["x86_64-macos"] = "sd-{tag}-x86_64-apple-darwin.tar.gz",
        },
    },
    ["name"] = "sd",
    ["aliases"] = {},
    ["description"] = "Find and replace text",
    ["homepage"] = "https://github.com/chmln/sd",
    ["default_version"] = "1.1.0",
    ["versions"] = {
        ["1.1.0"] = {
            ["revision"] = 1,
            ["source"] = "github:chmln/sd@v1.1.0",
            ["assets"] = {
                ["aarch64-linux"] = "sd-v1.1.0-aarch64-unknown-linux-musl.tar.gz",
                ["aarch64-macos"] = "sd-v1.1.0-aarch64-apple-darwin.tar.gz",
                ["x86_64-linux"] = "sd-v1.1.0-x86_64-unknown-linux-musl.tar.gz",
                ["x86_64-macos"] = "sd-v1.1.0-x86_64-apple-darwin.tar.gz",
            },
            ["systems"] = {
                "aarch64-linux",
                "aarch64-macos",
                "x86_64-linux",
                "x86_64-macos",
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
        },
    },
}
