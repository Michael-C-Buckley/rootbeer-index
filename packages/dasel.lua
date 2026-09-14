return {
    name = "dasel",
    description = "Query and transform structured data",
    default_version = "3.11.2",
    source = {
        github = "TomWright/dasel",
        tag = "v{version}",
        repository_id = 297615696,
        assets = {
            ["aarch64-linux"] = "dasel_linux_arm64",
            ["aarch64-macos"] = "dasel_darwin_arm64",
            ["x86_64-linux"] = "dasel_linux_amd64",
        },
    },
    bins = { "dasel" },
    checks = {
        { "dasel", "version" },
        { "dasel", "--help" },
    },
    versions = {
        ["3.11.2"] = { revision = 2 },
    },
}
