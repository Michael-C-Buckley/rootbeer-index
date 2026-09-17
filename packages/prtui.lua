return {
    schema = 2,
    name = "prtui",
    description = "Review GitHub pull requests in the terminal",
    default_version = "0.4.0",
    homepage = "https://github.com/tale/prtui",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "tale/prtui",
        repository_id = 1333872697,
        tag_prefix = "v",
    },
    build = {
        backend = "rust",
        rust = { packages = { "prtui" } },
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/tale/prtui/tar.gz/refs/tags/v{version}",
            archive = "tar.gz",
            strip_prefix = "prtui-{version}",
            git = { github = "tale/prtui", branch = "main" },
        },
        prebuilt = {
            github = "tale/prtui",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "prtui-{tag}-x86_64-unknown-linux-gnu.tar.gz",
                ["aarch64-macos"] = "prtui-{tag}-aarch64-apple-darwin.tar.gz",
                ["aarch64-linux"] = "prtui-{tag}-aarch64-unknown-linux-gnu.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "prtui" },
        checks = { { "prtui", "--version" }, { "prtui", "--help" } },
    },
    versions = {
        ["0.4.0"] = {
            inputs = {
                source = {
                    sha256 = "1620033443750761e0267ebac252474f9b63aec4576036183d6a6468835f6cbe",
                },
            },
        },
        ["0.3.0"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "2ee8317c161b5f95cab094809ded72498184e272ed9e6f415766053c38475502",
                },
            },
        },
    },
}
