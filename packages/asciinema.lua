return {
    name = "asciinema",
    description = "Record and replay terminal sessions",
    default_version = "3.2.1",
    source = {
        github = "asciinema/asciinema",
        tag = "v{version}",
        repository_id = 2823326,
        assets = {
            ["aarch64-linux"] = "asciinema-aarch64-unknown-linux-gnu",
            ["aarch64-macos"] = "asciinema-aarch64-apple-darwin",
            ["x86_64-linux"] = "asciinema-x86_64-unknown-linux-musl",
            ["x86_64-macos"] = "asciinema-x86_64-apple-darwin",
        },
    },
    bins = { "asciinema" },
    checks = {
        { "asciinema", "--version" },
        { "asciinema", "rec", "--help" },
    },
    versions = {
        ["3.2.1"] = {},
    },
}
