return {
    name = "sqlc",
    description = "Generate typed code from SQL",
    default_version = "1.31.1",
    source = {
        github = "sqlc-dev/sqlc",
        tag = "v{version}",
        repository_id = 193160679,
        assets = {
            ["aarch64-linux"] = "sqlc_{version}_linux_arm64.tar.gz",
            ["aarch64-macos"] = "sqlc_{version}_darwin_arm64.tar.gz",
            ["x86_64-linux"] = "sqlc_{version}_linux_amd64.tar.gz",
        },
    },
    bins = { "sqlc" },
    checks = {
        { "sqlc", "version" },
        { "sqlc", "generate", "--help" },
    },
    versions = {
        ["1.31.1"] = { revision = 2 },
    },
}
