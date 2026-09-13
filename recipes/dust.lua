return {
    ["name"] = "dust",
    ["aliases"] = {},
    ["description"] = "Inspect directory disk usage",
    ["homepage"] = "https://github.com/bootandy/dust",
    ["default_version"] = "1.2.5",
    ["versions"] = {
        ["1.2.5"] = {
            ["revision"] = 1,
            ["source"] = "github:bootandy/dust@v1.2.5",
            ["assets"] = {
                ["aarch64-linux"] = "dust-v1.2.5-aarch64-unknown-linux-musl.tar.gz",
                ["aarch64-macos"] = "dust-v1.2.5-aarch64-apple-darwin.tar.gz",
                ["x86_64-linux"] = "dust-v1.2.5-x86_64-unknown-linux-musl.tar.gz",
                ["x86_64-macos"] = "dust-v1.2.5-x86_64-apple-darwin.tar.gz",
            },
            ["systems"] = {
                "aarch64-linux",
                "aarch64-macos",
                "x86_64-linux",
                "x86_64-macos",
            },
            ["bins"] = {
                "dust",
            },
            ["checks"] = {
                {
                    "dust",
                    "--version",
                },
            },
        },
    },
}
