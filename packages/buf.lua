return {
    name = "buf",
    description = "Build and check Protocol Buffer schemas",
    default_version = "1.73.0",
    source = {
        github = "bufbuild/buf",
        tag = "v{version}",
        repository_id = 212465715,
        assets = {
            ["aarch64-linux"] = "buf-Linux-aarch64.tar.gz",
            ["aarch64-macos"] = "buf-Darwin-arm64.tar.gz",
            ["x86_64-linux"] = "buf-Linux-x86_64.tar.gz",
        },
    },
    bins = { "buf" },
    checks = {
        { "buf", "--version" },
        { "buf", "lint", "--help" },
    },
    versions = {
        ["1.73.0"] = { revision = 2 },
    },
}
