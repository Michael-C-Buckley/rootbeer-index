return {
    schema = 2,
    name = "migrate",
    description = "Apply database schema migrations",
    default_version = "4.20.1",
    homepage = "https://github.com/golang-migrate/migrate",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "golang-migrate/migrate",
        repository_id = 118105436,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "golang-migrate/migrate",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "migrate.linux-amd64.tar.gz",
                ["aarch64-macos"] = "migrate.darwin-arm64.tar.gz",
                ["aarch64-linux"] = "migrate.linux-arm64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "migrate" },
        checks = { { "migrate", "-version" }, { "migrate", "-help" } },
    },
    versions = {
        ["4.20.1"] = {
            revision = 2,
        },
    },
}
