return {
    name = "dive",
    description = "Explore container image layers",
    default_version = "0.13.1",
    source = {
        github = "wagoodman/dive",
        tag = "v{version}",
        repository_id = 133251103,
        assets = {
            ["aarch64-linux"] = "dive_{version}_linux_arm64.tar.gz",
            ["aarch64-macos"] = "dive_{version}_darwin_arm64.tar.gz",
            ["x86_64-linux"] = "dive_{version}_linux_amd64.tar.gz",
        },
    },
    bins = { "dive" },
    checks = {
        { "dive", "--version" },
        { "dive", "--help" },
    },
    versions = {
        ["0.13.1"] = { revision = 2 },
    },
}
