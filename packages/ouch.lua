return {
    name = "ouch",
    description = "Compress and extract archives",
    default_version = "0.8.3",
    source = {
        github = "ouch-org/ouch",
        tag = "{version}",
        repository_id = 349334268,
        assets = {
            ["aarch64-linux"] = "ouch-aarch64-unknown-linux-musl.tar.gz",
            ["aarch64-macos"] = "ouch-aarch64-apple-darwin.tar.gz",
            ["x86_64-linux"] = "ouch-x86_64-unknown-linux-musl.tar.gz",
            ["x86_64-macos"] = "ouch-x86_64-apple-darwin.tar.gz",
        },
    },
    bins = { "ouch" },
    checks = {
        { "ouch", "--version" },
        { "ouch", "--help" },
    },
    versions = {
        ["0.8.3"] = {},
    },
}
