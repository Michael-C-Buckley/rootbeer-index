return {
    schema = 2,
    name = "shfmt",
    description = "Format shell scripts",
    default_version = "3.14.1",
    homepage = "https://github.com/mvdan/sh",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "mvdan/sh",
        repository_id = 49766020,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "mvdan/sh",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "shfmt_{tag}_linux_amd64",
                ["aarch64-macos"] = "shfmt_{tag}_darwin_arm64",
                ["aarch64-linux"] = "shfmt_{tag}_linux_arm64",
            },
        },
    },
    outputs = {
        bins = { "shfmt" },
        checks = { { "shfmt", "--version" } },
    },
    versions = {
        ["3.14.1"] = {
            revision = 2,
        },
    },
}
