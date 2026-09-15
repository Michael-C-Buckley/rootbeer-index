return {
    schema = 2,
    name = "intermodal",
    description = "Create and inspect BitTorrent files",
    default_version = "0.1.16",
    homepage = "https://github.com/casey/intermodal",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "casey/intermodal",
        repository_id = 187931998,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "casey/intermodal",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "imdl-{tag}-x86_64-unknown-linux-musl.tar.gz",
                ["aarch64-macos"] = "imdl-{tag}-aarch64-apple-darwin.tar.gz",
                ["aarch64-linux"] = "imdl-{tag}-aarch64-unknown-linux-musl.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "imdl" },
        checks = { { "imdl", "--version" }, { "imdl", "--help" } },
    },
    versions = {
        ["0.1.16"] = {
            revision = 2,
        },
    },
}
