return {
    name = "just",
    description = "Run project commands",
    homepage = "https://just.systems",
    default_version = "1.58.0",
    source = {
        github = "casey/just",
        tag = "{version}",
        repository_id = 61349723,
        assets = {
            ["aarch64-linux"] = "just-{tag}-aarch64-unknown-linux-musl.tar.gz",
            ["aarch64-macos"] = "just-{tag}-aarch64-apple-darwin.tar.gz",
            ["x86_64-linux"] = "just-{tag}-x86_64-unknown-linux-musl.tar.gz",
        },
    },
    bins = { "just" },
    checks = {
        { "just", "--version" },
    },
    versions = {
        ["1.58.0"] = { revision = 2 },
    },
}
