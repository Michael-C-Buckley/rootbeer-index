return {
    name = "dufs",
    description = "Serve and share files over HTTP",
    default_version = "0.46.0",
    source = {
        github = "sigoden/dufs",
        tag = "v{version}",
        repository_id = 496605552,
        assets = {
            ["aarch64-linux"] = "dufs-{tag}-aarch64-unknown-linux-musl.tar.gz",
            ["aarch64-macos"] = "dufs-{tag}-aarch64-apple-darwin.tar.gz",
            ["x86_64-linux"] = "dufs-{tag}-x86_64-unknown-linux-musl.tar.gz",
        },
    },
    bins = { "dufs" },
    checks = {
        { "dufs", "--version" },
        { "dufs", "--help" },
    },
    versions = {
        ["0.46.0"] = { revision = 2 },
    },
}
