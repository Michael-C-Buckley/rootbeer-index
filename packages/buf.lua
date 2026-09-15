return {
    schema = 2,
    name = "buf",
    description = "Build and check Protocol Buffer schemas",
    default_version = "1.73.0",
    homepage = "https://github.com/bufbuild/buf",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "bufbuild/buf",
        repository_id = 212465715,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "bufbuild/buf",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "buf-Linux-x86_64.tar.gz",
                ["aarch64-macos"] = "buf-Darwin-arm64.tar.gz",
                ["aarch64-linux"] = "buf-Linux-aarch64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "buf" },
        checks = { { "buf", "--version" }, { "buf", "lint", "--help" } },
    },
    versions = {
        ["1.73.0"] = {
            revision = 2,
        },
    },
}
