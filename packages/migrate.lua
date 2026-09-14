return {
    name = "migrate",
    description = "Apply database schema migrations",
    default_version = "4.20.1",
    source = {
        github = "golang-migrate/migrate",
        tag = "v{version}",
        repository_id = 118105436,
        assets = {
            ["aarch64-linux"] = "migrate.linux-arm64.tar.gz",
            ["aarch64-macos"] = "migrate.darwin-arm64.tar.gz",
            ["x86_64-linux"] = "migrate.linux-amd64.tar.gz",
        },
    },
    bins = { "migrate" },
    checks = {
        { "migrate", "-version" },
        { "migrate", "-help" },
    },
    versions = {
        ["4.20.1"] = { revision = 2 },
    },
}
