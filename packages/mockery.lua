return {
    name = "mockery",
    description = "Generate Go interface mocks",
    default_version = "3.8.0",
    source = {
        github = "vektra/mockery",
        tag = "v{version}",
        repository_id = 23586998,
        assets = {
            ["aarch64-linux"] = "mockery_{version}_Linux_arm64.tar.gz",
            ["aarch64-macos"] = "mockery_{version}_Darwin_arm64.tar.gz",
            ["x86_64-linux"] = "mockery_{version}_Linux_x86_64.tar.gz",
            ["x86_64-macos"] = "mockery_{version}_Darwin_x86_64.tar.gz",
        },
    },
    bins = { "mockery" },
    checks = {
        { "mockery", "version" },
        { "mockery", "--help" },
    },
    versions = {
        ["3.8.0"] = {},
    },
}
