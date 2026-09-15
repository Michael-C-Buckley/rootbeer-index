return {
    schema = 2,
    name = "dive",
    description = "Explore container image layers",
    default_version = "0.13.1",
    homepage = "https://github.com/wagoodman/dive",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "wagoodman/dive",
        repository_id = 133251103,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "wagoodman/dive",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "dive_{version}_linux_amd64.tar.gz",
                ["aarch64-macos"] = "dive_{version}_darwin_arm64.tar.gz",
                ["aarch64-linux"] = "dive_{version}_linux_arm64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "dive" },
        checks = { { "dive", "--version" }, { "dive", "--help" } },
    },
    versions = {
        ["0.13.1"] = {
            revision = 2,
        },
    },
}
