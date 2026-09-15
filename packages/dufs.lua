return {
    schema = 2,
    name = "dufs",
    description = "Serve and share files over HTTP",
    default_version = "0.46.0",
    homepage = "https://github.com/sigoden/dufs",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "sigoden/dufs",
        repository_id = 496605552,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "sigoden/dufs",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "dufs-{tag}-x86_64-unknown-linux-musl.tar.gz",
                ["aarch64-macos"] = "dufs-{tag}-aarch64-apple-darwin.tar.gz",
                ["aarch64-linux"] = "dufs-{tag}-aarch64-unknown-linux-musl.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "dufs" },
        checks = { { "dufs", "--version" }, { "dufs", "--help" } },
    },
    versions = {
        ["0.46.0"] = {
            revision = 2,
        },
    },
}
