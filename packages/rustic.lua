return {
    schema = 2,
    name = "rustic",
    description = "Back up files with deduplication and encryption",
    default_version = "0.11.4",
    homepage = "https://github.com/rustic-rs/rustic",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "rustic-rs/rustic",
        repository_id = 469809167,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "rustic-rs/rustic",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "rustic-{tag}-x86_64-unknown-linux-musl.tar.gz",
                ["aarch64-macos"] = "rustic-{tag}-aarch64-apple-darwin.tar.gz",
                ["aarch64-linux"] = "rustic-{tag}-aarch64-unknown-linux-musl.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "rustic" },
        checks = { { "rustic", "--version" }, { "rustic", "backup", "--help" } },
    },
    versions = {
        ["0.11.4"] = {
            revision = 2,
        },
    },
}
