return {
    name = "vivid",
    description = "Generate color themes for file listings",
    default_version = "0.11.1",
    source = {
        github = "sharkdp/vivid",
        tag = "v{version}",
        repository_id = 158295285,
        assets = {
            ["aarch64-linux"] = "vivid-{tag}-aarch64-unknown-linux-gnu.tar.gz",
            ["aarch64-macos"] = "vivid-{tag}-aarch64-apple-darwin.tar.gz",
            ["x86_64-linux"] = "vivid-{tag}-x86_64-unknown-linux-musl.tar.gz",
        },
    },
    bins = { "vivid" },
    checks = {
        { "vivid", "--version" },
        { "vivid", "generate", "molokai" },
    },
    versions = {
        ["0.11.1"] = { revision = 2 },
    },
}
