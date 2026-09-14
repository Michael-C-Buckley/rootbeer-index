return {
    name = "fd",
    description = "Find files by name",
    default_version = "10.5.0",
    source = {
        github = "sharkdp/fd",
        tag = "v{version}",
        repository_id = 90793418,
        assets = {
            ["aarch64-linux"] = "fd-{tag}-aarch64-unknown-linux-musl.tar.gz",
            ["aarch64-macos"] = "fd-{tag}-aarch64-apple-darwin.tar.gz",
            ["x86_64-linux"] = "fd-{tag}-x86_64-unknown-linux-musl.tar.gz",
        },
    },
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    bins = { "fd" },
    checks = {
        { "fd", "--version" },
    },
    versions = {
        ["10.4.2"] = {
            revision = 2,
            systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
        },
        ["10.5.0"] = { revision = 2 },
    },
}
