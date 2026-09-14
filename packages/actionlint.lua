return {
    name = "actionlint",
    description = "Check GitHub Actions workflows",
    default_version = "1.7.12",
    source = {
        github = "rhysd/actionlint",
        tag = "v{version}",
        repository_id = 370668507,
        assets = {
            ["aarch64-linux"] = "actionlint_{version}_linux_arm64.tar.gz",
            ["aarch64-macos"] = "actionlint_{version}_darwin_arm64.tar.gz",
            ["x86_64-linux"] = "actionlint_{version}_linux_amd64.tar.gz",
        },
    },
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    bins = { "actionlint" },
    checks = {
        { "actionlint", "-version" },
    },
    versions = {
        ["1.7.12"] = { revision = 2 },
    },
}
