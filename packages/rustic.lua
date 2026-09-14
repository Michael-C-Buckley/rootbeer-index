return {
    name = "rustic",
    description = "Back up files with deduplication and encryption",
    default_version = "0.11.4",
    source = {
        github = "rustic-rs/rustic",
        tag = "v{version}",
        repository_id = 469809167,
        assets = {
            ["aarch64-linux"] = "rustic-{tag}-aarch64-unknown-linux-musl.tar.gz",
            ["aarch64-macos"] = "rustic-{tag}-aarch64-apple-darwin.tar.gz",
            ["x86_64-linux"] = "rustic-{tag}-x86_64-unknown-linux-musl.tar.gz",
        },
    },
    bins = { "rustic" },
    checks = {
        { "rustic", "--version" },
        { "rustic", "backup", "--help" },
    },
    versions = {
        ["0.11.4"] = { revision = 2 },
    },
}
