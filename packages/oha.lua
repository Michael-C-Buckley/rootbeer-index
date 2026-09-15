return {
    schema = 2,
    name = "oha",
    description = "Load test HTTP services",
    default_version = "1.16.0",
    homepage = "https://github.com/hatoo/oha",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "hatoo/oha",
        repository_id = 244377430,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "hatoo/oha",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "oha-linux-amd64",
                ["aarch64-macos"] = "oha-macos-arm64",
                ["aarch64-linux"] = "oha-linux-arm64",
            },
        },
    },
    outputs = {
        bins = { "oha" },
        checks = { { "oha", "--version" }, { "oha", "--help" } },
    },
    versions = {
        ["1.16.0"] = {
            revision = 2,
        },
    },
}
