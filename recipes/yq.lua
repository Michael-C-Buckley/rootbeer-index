return {
    ["name"] = "yq",
    ["aliases"] = {},
    ["description"] = "Query and transform structured data",
    ["homepage"] = "https://mikefarah.gitbook.io/yq/",
    ["default_version"] = "4.53.6",
    ["versions"] = {
        ["4.53.6"] = {
            ["revision"] = 1,
            ["source"] = "github:mikefarah/yq@v4.53.6",
            ["assets"] = {
                ["aarch64-linux"] = "yq_linux_arm64",
                ["aarch64-macos"] = "yq_darwin_arm64",
                ["x86_64-linux"] = "yq_linux_amd64",
                ["x86_64-macos"] = "yq_darwin_amd64",
            },
            ["systems"] = {
                "aarch64-linux",
                "aarch64-macos",
                "x86_64-linux",
                "x86_64-macos",
            },
            ["bins"] = {
                "yq",
            },
            ["checks"] = {
                {
                    "yq",
                    "--version",
                },
                {
                    "yq",
                    "--null-input",
                    "--exit-status",
                    "1 + 2 == 3",
                },
            },
        },
    },
}
