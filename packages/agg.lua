return {
    name = "agg",
    description = "Convert terminal recordings to animated GIFs",
    default_version = "1.9.0",
    source = {
        github = "asciinema/agg",
        tag = "v{version}",
        repository_id = 519132476,
        assets = {
            ["aarch64-linux"] = "agg-aarch64-unknown-linux-gnu",
            ["aarch64-macos"] = "agg-aarch64-apple-darwin",
            ["x86_64-linux"] = "agg-x86_64-unknown-linux-musl",
            ["x86_64-macos"] = "agg-x86_64-apple-darwin",
        },
    },
    bins = { "agg" },
    checks = {
        { "agg", "--version" },
        { "agg", "--help" },
    },
    versions = {
        ["1.9.0"] = {},
    },
}
