return {
    name = "bandwhich",
    description = "Monitor network usage by process",
    default_version = "0.23.1",
    source = {
        github = "imsnif/bandwhich",
        tag = "v{version}",
        repository_id = 206874323,
        assets = {
            ["aarch64-linux"] = "bandwhich-{tag}-aarch64-unknown-linux-musl.tar.gz",
            ["aarch64-macos"] = "bandwhich-{tag}-aarch64-apple-darwin.tar.gz",
            ["x86_64-linux"] = "bandwhich-{tag}-x86_64-unknown-linux-musl.tar.gz",
        },
    },
    bins = { "bandwhich" },
    checks = {
        { "bandwhich", "--version" },
        { "bandwhich", "--help" },
    },
    versions = {
        ["0.23.1"] = { revision = 2 },
    },
}
