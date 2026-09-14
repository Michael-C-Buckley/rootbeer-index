return {
    name = "shfmt",
    description = "Format shell scripts",
    default_version = "3.14.1",
    source = {
        github = "mvdan/sh",
        tag = "v{version}",
        repository_id = 49766020,
        assets = {
            ["aarch64-linux"] = "shfmt_{tag}_linux_arm64",
            ["aarch64-macos"] = "shfmt_{tag}_darwin_arm64",
            ["x86_64-linux"] = "shfmt_{tag}_linux_amd64",
        },
    },
    bins = { "shfmt" },
    checks = {
        { "shfmt", "--version" },
    },
    versions = {
        ["3.14.1"] = { revision = 2 },
    },
}
