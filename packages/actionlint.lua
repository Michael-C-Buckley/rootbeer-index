return {
    schema = 2,
    name = "actionlint",
    description = "Check GitHub Actions workflows",
    default_version = "1.7.12",
    homepage = "https://github.com/rhysd/actionlint",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "rhysd/actionlint",
        repository_id = 370668507,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "rhysd/actionlint",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "actionlint_{version}_linux_amd64.tar.gz",
                ["aarch64-macos"] = "actionlint_{version}_darwin_arm64.tar.gz",
                ["aarch64-linux"] = "actionlint_{version}_linux_arm64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "actionlint" },
        checks = { { "actionlint", "-version" } },
    },
    versions = {
        ["1.7.12"] = {
            revision = 2,
        },
    },
}
