return {
    schema = 2,
    name = "just",
    description = "Run project commands",
    default_version = "1.58.0",
    homepage = "https://just.systems",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "casey/just",
        repository_id = 61349723,
        tag_prefix = "",
    },
    inputs = {
        prebuilt = {
            github = "casey/just",
            tag = "{version}",
            assets = {
                ["x86_64-linux"] = "just-{tag}-x86_64-unknown-linux-musl.tar.gz",
                ["aarch64-macos"] = "just-{tag}-aarch64-apple-darwin.tar.gz",
                ["aarch64-linux"] = "just-{tag}-aarch64-unknown-linux-musl.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "just" },
        checks = { { "just", "--version" } },
    },
    versions = {
        ["1.58.0"] = {
            revision = 2,
        },
    },
}
