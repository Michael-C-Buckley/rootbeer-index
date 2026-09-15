return {
    schema = 2,
    name = "air",
    description = "Reload Go applications during development",
    default_version = "1.67.4",
    homepage = "https://github.com/air-verse/air",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "air-verse/air",
        repository_id = 106704041,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "air-verse/air",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "air_{version}_linux_amd64.tar.gz",
                ["aarch64-macos"] = "air_{version}_darwin_arm64.tar.gz",
                ["aarch64-linux"] = "air_{version}_linux_arm64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "air" },
        checks = { { "air", "-v" }, { "air", "-h" } },
    },
    versions = {
        ["1.67.4"] = {
            revision = 2,
        },
    },
}
