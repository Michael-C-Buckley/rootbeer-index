return {
    name = "choose",
    description = "Select fields and ranges from text",
    default_version = "1.3.7",
    source = {
        github = "theryangeary/choose",
        tag = "v{version}",
        repository_id = 207951619,
        assets = {
            ["aarch64-linux"] = "choose-aarch64-unknown-linux-gnu",
            ["aarch64-macos"] = "choose-aarch64-apple-darwin",
            ["x86_64-linux"] = "choose-x86_64-unknown-linux-musl",
        },
    },
    bins = { "choose" },
    checks = {
        { "choose", "--version" },
        { "choose", "--help" },
    },
    versions = {
        ["1.3.7"] = {},
    },
}
