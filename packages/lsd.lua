return {
    name = "lsd",
    description = "List directory contents",
    default_version = "1.2.0",
    source = {
        github = "lsd-rs/lsd",
        tag = "v{version}",
        repository_id = 158927812,
        assets = {
            ["aarch64-linux"] = "lsd-{tag}-aarch64-unknown-linux-musl.tar.gz",
            ["aarch64-macos"] = "lsd-{tag}-aarch64-apple-darwin.tar.gz",
            ["x86_64-linux"] = "lsd-{tag}-x86_64-unknown-linux-musl.tar.gz",
            ["x86_64-macos"] = "lsd-{tag}-x86_64-apple-darwin.tar.gz",
        },
    },
    systems = { "aarch64-macos", "x86_64-macos", "aarch64-linux", "x86_64-linux" },
    bins = { "lsd" },
    checks = {
        { "lsd", "--version" },
    },
    versions = {
        ["1.2.0"] = {},
    },
}
