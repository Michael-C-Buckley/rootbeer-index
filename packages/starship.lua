return {
    upstream = {
        provider = "github",
        repository = "starship/starship",
        repository_id = 178991158,
        assets = {
            ["aarch64-linux"] = "starship-aarch64-unknown-linux-musl.tar.gz",
            ["aarch64-macos"] = "starship-aarch64-apple-darwin.tar.gz",
            ["x86_64-linux"] = "starship-x86_64-unknown-linux-musl.tar.gz",
            ["x86_64-macos"] = "starship-x86_64-apple-darwin.tar.gz",
        },
    },
    ["name"] = "starship",
    ["aliases"] = {},
    ["description"] = "Configure shell prompts",
    ["homepage"] = "https://starship.rs",
    ["default_version"] = "1.26.0",
    ["versions"] = {
        ["1.26.0"] = {
            ["revision"] = 1,
            ["source"] = "github:starship/starship@v1.26.0",
            ["assets"] = {
                ["aarch64-linux"] = "starship-aarch64-unknown-linux-musl.tar.gz",
                ["aarch64-macos"] = "starship-aarch64-apple-darwin.tar.gz",
                ["x86_64-linux"] = "starship-x86_64-unknown-linux-musl.tar.gz",
                ["x86_64-macos"] = "starship-x86_64-apple-darwin.tar.gz",
            },
            ["systems"] = {
                "aarch64-linux",
                "aarch64-macos",
                "x86_64-linux",
                "x86_64-macos",
            },
            ["bins"] = {
                "starship",
            },
            ["checks"] = {
                {
                    "starship",
                    "--version",
                },
                {
                    "starship",
                    "init",
                    "zsh",
                },
            },
        },
    },
}
