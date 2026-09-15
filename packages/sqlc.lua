return {
    schema = 2,
    name = "sqlc",
    description = "Generate typed code from SQL",
    default_version = "1.31.1",
    homepage = "https://github.com/sqlc-dev/sqlc",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "sqlc-dev/sqlc",
        repository_id = 193160679,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "sqlc-dev/sqlc",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "sqlc_{version}_linux_amd64.tar.gz",
                ["aarch64-macos"] = "sqlc_{version}_darwin_arm64.tar.gz",
                ["aarch64-linux"] = "sqlc_{version}_linux_arm64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "sqlc" },
        checks = { { "sqlc", "version" }, { "sqlc", "generate", "--help" } },
    },
    versions = {
        ["1.31.1"] = {
            revision = 2,
        },
    },
}
