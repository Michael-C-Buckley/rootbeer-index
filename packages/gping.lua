return {
    schema = 2,
    name = "gping",
    description = "Graph ping response times",
    default_version = "1.21.0",
    homepage = "https://github.com/orf/gping",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "orf/gping",
        repository_id = 44440501,
        tag_prefix = "gping-v",
    },
    inputs = {
        prebuilt = {
            github = "orf/gping",
            tag = "gping-v{version}",
            assets = {
                ["x86_64-linux"] = "gping-Linux-musl-x86_64.tar.gz",
                ["aarch64-macos"] = "gping-macOS-arm64.tar.gz",
                ["aarch64-linux"] = "gping-Linux-musl-arm64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "gping" },
        checks = { { "gping", "--version" }, { "gping", "--help" } },
    },
    versions = {
        ["1.21.0"] = {
            revision = 2,
        },
    },
}
