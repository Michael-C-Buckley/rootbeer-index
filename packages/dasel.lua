return {
    schema = 2,
    name = "dasel",
    description = "Query and transform structured data",
    default_version = "3.11.2",
    homepage = "https://github.com/TomWright/dasel",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "TomWright/dasel",
        repository_id = 297615696,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "TomWright/dasel",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "dasel_linux_amd64",
                ["aarch64-macos"] = "dasel_darwin_arm64",
                ["aarch64-linux"] = "dasel_linux_arm64",
            },
        },
    },
    outputs = {
        bins = { "dasel" },
        checks = { { "dasel", "version" }, { "dasel", "--help" } },
    },
    versions = {
        ["3.11.2"] = {
            revision = 2,
        },
    },
}
