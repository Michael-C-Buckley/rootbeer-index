return {
    name = "sd",
    description = "Find and replace text",
    default_version = "1.1.0",
    source = {
        github = "chmln/sd",
        tag = "v{version}",
        repository_id = 162863623,
        assets = {
            ["aarch64-linux"] = "sd-{tag}-aarch64-unknown-linux-musl.tar.gz",
            ["aarch64-macos"] = "sd-{tag}-aarch64-apple-darwin.tar.gz",
            ["x86_64-linux"] = "sd-{tag}-x86_64-unknown-linux-musl.tar.gz",
        },
    },
    bins = { "sd" },
    checks = {
        { "sd", "--version" },
    },
    versions = {
        ["1.1.0"] = { revision = 2 },
    },
}
