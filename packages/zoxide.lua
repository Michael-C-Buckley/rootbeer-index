return {
    upstream = {
        provider = "github",
        repository = "ajeetdsouza/zoxide",
        repository_id = 245166720,
        assets = {
            ["aarch64-linux"] = "zoxide-{version}-aarch64-unknown-linux-musl.tar.gz",
            ["aarch64-macos"] = "zoxide-{version}-aarch64-apple-darwin.tar.gz",
            ["x86_64-linux"] = "zoxide-{version}-x86_64-unknown-linux-musl.tar.gz",
            ["x86_64-macos"] = "zoxide-{version}-x86_64-apple-darwin.tar.gz",
        },
    },
    ["name"] = "zoxide",
    ["aliases"] = {},
    ["description"] = "Navigate frequently used directories",
    ["homepage"] = "https://crates.io/crates/zoxide",
    ["default_version"] = "0.10.0",
    ["versions"] = {
        ["0.10.0"] = {
            ["revision"] = 1,
            ["source"] = "github:ajeetdsouza/zoxide@v0.10.0",
            ["assets"] = {
                ["aarch64-linux"] = "zoxide-0.10.0-aarch64-unknown-linux-musl.tar.gz",
                ["aarch64-macos"] = "zoxide-0.10.0-aarch64-apple-darwin.tar.gz",
                ["x86_64-linux"] = "zoxide-0.10.0-x86_64-unknown-linux-musl.tar.gz",
                ["x86_64-macos"] = "zoxide-0.10.0-x86_64-apple-darwin.tar.gz",
            },
            ["systems"] = {
                "aarch64-linux",
                "aarch64-macos",
                "x86_64-linux",
                "x86_64-macos",
            },
            ["bins"] = {
                "zoxide",
            },
            ["checks"] = {
                {
                    "zoxide",
                    "--version",
                },
                {
                    "zoxide",
                    "init",
                    "zsh",
                },
            },
        },
    },
}
