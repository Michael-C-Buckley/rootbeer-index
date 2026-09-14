return {
    name = "duf",
    description = "Inspect filesystem disk usage",
    default_version = "0.9.1",
    source = {
        github = "muesli/duf",
        tag = "v{version}",
        repository_id = 297165998,
        assets = {
            ["aarch64-linux"] = "duf_{version}_linux_arm64.tar.gz",
            ["aarch64-macos"] = "duf_{version}_darwin_arm64.tar.gz",
            ["x86_64-linux"] = "duf_{version}_linux_x86_64.tar.gz",
        },
    },
    bins = { "duf" },
    checks = {
        { "duf", "--version" },
    },
    versions = {
        ["0.9.1"] = { revision = 2 },
    },
}
