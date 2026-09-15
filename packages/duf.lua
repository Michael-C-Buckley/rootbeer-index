return {
    schema = 2,
    name = "duf",
    description = "Inspect filesystem disk usage",
    default_version = "0.9.1",
    homepage = "https://github.com/muesli/duf",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "muesli/duf",
        repository_id = 297165998,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "muesli/duf",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "duf_{version}_linux_x86_64.tar.gz",
                ["aarch64-macos"] = "duf_{version}_darwin_arm64.tar.gz",
                ["aarch64-linux"] = "duf_{version}_linux_arm64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "duf" },
        checks = { { "duf", "--version" } },
    },
    versions = {
        ["0.9.1"] = {
            revision = 2,
        },
    },
}
