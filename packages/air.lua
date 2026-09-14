return {
    name = "air",
    description = "Reload Go applications during development",
    default_version = "1.67.4",
    source = {
        github = "air-verse/air",
        tag = "v{version}",
        repository_id = 106704041,
        assets = {
            ["aarch64-linux"] = "air_{version}_linux_arm64.tar.gz",
            ["aarch64-macos"] = "air_{version}_darwin_arm64.tar.gz",
            ["x86_64-linux"] = "air_{version}_linux_amd64.tar.gz",
            ["x86_64-macos"] = "air_{version}_darwin_amd64.tar.gz",
        },
    },
    bins = { "air" },
    checks = {
        { "air", "-v" },
        { "air", "-h" },
    },
    versions = {
        ["1.67.4"] = {},
    },
}
