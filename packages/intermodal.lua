return {
    name = "intermodal",
    description = "Create and inspect BitTorrent files",
    default_version = "0.1.16",
    source = {
        github = "casey/intermodal",
        tag = "v{version}",
        repository_id = 187931998,
        assets = {
            ["aarch64-linux"] = "imdl-{tag}-aarch64-unknown-linux-musl.tar.gz",
            ["aarch64-macos"] = "imdl-{tag}-aarch64-apple-darwin.tar.gz",
            ["x86_64-linux"] = "imdl-{tag}-x86_64-unknown-linux-musl.tar.gz",
        },
    },
    bins = { "imdl" },
    checks = {
        { "imdl", "--version" },
        { "imdl", "--help" },
    },
    versions = {
        ["0.1.16"] = { revision = 2 },
    },
}
