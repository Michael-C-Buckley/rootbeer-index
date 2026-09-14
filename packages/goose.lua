return {
    name = "goose",
    description = "Run database migrations",
    default_version = "3.28.0",
    source = {
        github = "pressly/goose",
        tag = "v{version}",
        repository_id = 52555254,
        assets = {
            ["aarch64-linux"] = "goose_linux_arm64",
            ["aarch64-macos"] = "goose_darwin_arm64",
            ["x86_64-linux"] = "goose_linux_x86_64",
        },
    },
    bins = { "goose" },
    checks = {
        { "goose", "-version" },
        { "goose", "-h" },
    },
    versions = {
        ["3.28.0"] = { revision = 2 },
    },
}
