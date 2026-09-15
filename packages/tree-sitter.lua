return {
    schema = 2,
    name = "tree-sitter",
    description = "Generate parsers and inspect syntax trees",
    default_version = "0.27.0",
    homepage = "https://github.com/tree-sitter/tree-sitter",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "tree-sitter/tree-sitter",
        repository_id = 14164618,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "tree-sitter/tree-sitter",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "tree-sitter-cli-linux-x64.zip",
                ["aarch64-macos"] = "tree-sitter-cli-macos-arm64.zip",
                ["aarch64-linux"] = "tree-sitter-cli-linux-arm64.zip",
            },
        },
    },
    outputs = {
        bins = { "tree-sitter" },
        checks = { { "tree-sitter", "--version" }, { "tree-sitter", "query", "--help" } },
    },
    versions = {
        ["0.27.0"] = {
            revision = 2,
        },
    },
}
