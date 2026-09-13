return {
    upstream = {
        provider = "github",
        repository = "FiloSottile/age",
        repository_id = 187403699,
        assets = {
            ["aarch64-linux"] = "age-{tag}-linux-arm64.tar.gz",
            ["aarch64-macos"] = "age-{tag}-darwin-arm64.tar.gz",
            ["x86_64-linux"] = "age-{tag}-linux-amd64.tar.gz",
            ["x86_64-macos"] = "age-{tag}-darwin-amd64.tar.gz",
        },
    },
    ["name"] = "age",
    ["aliases"] = {},
    ["description"] = "File encryption with explicit recipients",
    ["homepage"] = "https://age-encryption.org/",
    ["default_version"] = "1.3.2",
    ["versions"] = {
        ["1.3.1"] = {
            ["revision"] = 2,
            ["source"] = "github:FiloSottile/age@v1.3.1",
            ["assets"] = {
                ["aarch64-linux"] = "age-v1.3.1-linux-arm64.tar.gz",
                ["aarch64-macos"] = "age-v1.3.1-darwin-arm64.tar.gz",
                ["x86_64-linux"] = "age-v1.3.1-linux-amd64.tar.gz",
                ["x86_64-macos"] = "age-v1.3.1-darwin-amd64.tar.gz",
            },
            ["systems"] = {
                "aarch64-macos",
                "x86_64-macos",
                "aarch64-linux",
                "x86_64-linux",
            },
            ["bins"] = {
                "age",
                "age-keygen",
            },
            ["checks"] = {
                {
                    "age",
                    "--version",
                },
                {
                    "age-keygen",
                    "--version",
                },
            },
        },
        ["1.3.2"] = {
            ["revision"] = 1,
            ["source"] = "github:FiloSottile/age@v1.3.2",
            ["assets"] = {
                ["aarch64-linux"] = "age-v1.3.2-linux-arm64.tar.gz",
                ["aarch64-macos"] = "age-v1.3.2-darwin-arm64.tar.gz",
                ["x86_64-linux"] = "age-v1.3.2-linux-amd64.tar.gz",
                ["x86_64-macos"] = "age-v1.3.2-darwin-amd64.tar.gz",
            },
            ["systems"] = {
                "aarch64-linux",
                "aarch64-macos",
                "x86_64-linux",
                "x86_64-macos",
            },
            ["bins"] = {
                "age",
                "age-keygen",
            },
            ["checks"] = {
                {
                    "age",
                    "--version",
                },
                {
                    "age-keygen",
                    "--version",
                },
            },
        },
    },
}
