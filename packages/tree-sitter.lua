return {
    name = "tree-sitter",
    description = "Generate parsers and inspect syntax trees",
    default_version = "0.27.0",
    source = {
        github = "tree-sitter/tree-sitter",
        tag = "v{version}",
        repository_id = 14164618,
        assets = {
            ["aarch64-linux"] = "tree-sitter-cli-linux-arm64.zip",
            ["aarch64-macos"] = "tree-sitter-cli-macos-arm64.zip",
            ["x86_64-linux"] = "tree-sitter-cli-linux-x64.zip",
            ["x86_64-macos"] = "tree-sitter-cli-macos-x64.zip",
        },
    },
    bins = { "tree-sitter" },
    checks = {
        { "tree-sitter", "--version" },
        { "tree-sitter", "query", "--help" },
    },
    versions = {
        ["0.27.0"] = {},
    },
}
