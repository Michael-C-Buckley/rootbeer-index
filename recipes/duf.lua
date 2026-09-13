return {
    ["name"] = "duf",
    ["aliases"] = {},
    ["description"] = "Inspect filesystem disk usage",
    ["homepage"] = "https://github.com/muesli/duf",
    ["default_version"] = "0.9.1",
    ["versions"] = {
        ["0.9.1"] = {
            ["revision"] = 1,
            ["source"] = "github:muesli/duf@v0.9.1",
            ["assets"] = {
                ["aarch64-linux"] = "duf_0.9.1_linux_arm64.tar.gz",
                ["aarch64-macos"] = "duf_0.9.1_darwin_arm64.tar.gz",
                ["x86_64-linux"] = "duf_0.9.1_linux_x86_64.tar.gz",
                ["x86_64-macos"] = "duf_0.9.1_darwin_x86_64.tar.gz",
            },
            ["systems"] = {
                "aarch64-linux",
                "aarch64-macos",
                "x86_64-linux",
                "x86_64-macos",
            },
            ["bins"] = {
                "duf",
            },
            ["checks"] = {
                {
                    "duf",
                    "--version",
                },
            },
        },
    },
}
