return {
    schema = 2,
    name = "asciinema",
    description = "Record and replay terminal sessions",
    default_version = "3.2.1",
    homepage = "https://github.com/asciinema/asciinema",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "asciinema/asciinema",
        repository_id = 2823326,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "asciinema/asciinema",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "asciinema-x86_64-unknown-linux-musl",
                ["aarch64-macos"] = "asciinema-aarch64-apple-darwin",
                ["aarch64-linux"] = "asciinema-aarch64-unknown-linux-gnu",
            },
        },
    },
    outputs = {
        bins = { "asciinema" },
        checks = { { "asciinema", "--version" }, { "asciinema", "rec", "--help" } },
    },
    versions = {
        ["3.2.1"] = {
            revision = 2,
        },
    },
}
