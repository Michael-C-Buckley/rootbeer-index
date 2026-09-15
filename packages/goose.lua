return {
    schema = 2,
    name = "goose",
    description = "Run database migrations",
    default_version = "3.28.0",
    homepage = "https://github.com/pressly/goose",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "pressly/goose",
        repository_id = 52555254,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "pressly/goose",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "goose_linux_x86_64",
                ["aarch64-macos"] = "goose_darwin_arm64",
                ["aarch64-linux"] = "goose_linux_arm64",
            },
        },
    },
    outputs = {
        bins = { "goose" },
        checks = { { "goose", "-version" }, { "goose", "-h" } },
    },
    versions = {
        ["3.28.0"] = {
            revision = 2,
        },
    },
}
