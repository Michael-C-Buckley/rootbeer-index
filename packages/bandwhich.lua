return {
    schema = 2,
    name = "bandwhich",
    description = "Monitor network usage by process",
    default_version = "0.23.1",
    homepage = "https://github.com/imsnif/bandwhich",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "imsnif/bandwhich",
        repository_id = 206874323,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "imsnif/bandwhich",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "bandwhich-{tag}-x86_64-unknown-linux-musl.tar.gz",
                ["aarch64-macos"] = "bandwhich-{tag}-aarch64-apple-darwin.tar.gz",
                ["aarch64-linux"] = "bandwhich-{tag}-aarch64-unknown-linux-musl.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "bandwhich" },
        checks = { { "bandwhich", "--version" }, { "bandwhich", "--help" } },
    },
    versions = {
        ["0.23.1"] = {
            revision = 2,
        },
    },
}
