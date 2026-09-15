return {
    schema = 2,
    name = "lsd",
    description = "List directory contents",
    default_version = "1.2.0",
    homepage = "https://github.com/lsd-rs/lsd",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    upstream = {
        github = "lsd-rs/lsd",
        repository_id = 158927812,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "lsd-rs/lsd",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "lsd-{tag}-x86_64-unknown-linux-musl.tar.gz",
                ["aarch64-macos"] = "lsd-{tag}-aarch64-apple-darwin.tar.gz",
                ["aarch64-linux"] = "lsd-{tag}-aarch64-unknown-linux-musl.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "lsd" },
        checks = { { "lsd", "--version" } },
    },
    versions = {
        ["1.2.0"] = {
            revision = 2,
        },
    },
}
