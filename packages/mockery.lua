return {
    schema = 2,
    name = "mockery",
    description = "Generate Go interface mocks",
    default_version = "3.8.0",
    homepage = "https://github.com/vektra/mockery",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "vektra/mockery",
        repository_id = 23586998,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "vektra/mockery",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "mockery_{version}_Linux_x86_64.tar.gz",
                ["aarch64-macos"] = "mockery_{version}_Darwin_arm64.tar.gz",
                ["aarch64-linux"] = "mockery_{version}_Linux_arm64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "mockery" },
        checks = { { "mockery", "version" }, { "mockery", "--help" } },
    },
    versions = {
        ["3.8.0"] = {
            revision = 2,
        },
    },
}
