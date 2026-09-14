return {
    name = "gping",
    description = "Graph ping response times",
    default_version = "1.21.0",
    source = {
        github = "orf/gping",
        tag = "gping-v{version}",
        repository_id = 44440501,
        assets = {
            ["aarch64-linux"] = "gping-Linux-musl-arm64.tar.gz",
            ["aarch64-macos"] = "gping-macOS-arm64.tar.gz",
            ["x86_64-linux"] = "gping-Linux-musl-x86_64.tar.gz",
        },
    },
    bins = { "gping" },
    checks = {
        { "gping", "--version" },
        { "gping", "--help" },
    },
    versions = {
        ["1.21.0"] = { revision = 2 },
    },
}
