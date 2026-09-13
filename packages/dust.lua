return {
    name = "dust",
    description = "Inspect directory disk usage",
    default_version = "1.2.5",
    source = {
        github = "bootandy/dust",
        tag = "v{version}",
        repository_id = 125563061,
        exclude_tags = { "v0.8.1-alpha.2", "v0.8.1-alpha.1", "untagged-1499119fdec1dec70238" },
        assets = {
            ["aarch64-linux"] = "dust-{tag}-aarch64-unknown-linux-musl.tar.gz",
            ["aarch64-macos"] = "dust-{tag}-aarch64-apple-darwin.tar.gz",
            ["x86_64-linux"] = "dust-{tag}-x86_64-unknown-linux-musl.tar.gz",
            ["x86_64-macos"] = "dust-{tag}-x86_64-apple-darwin.tar.gz",
        },
    },
    bins = { "dust" },
    checks = {
        { "dust", "--version" },
    },
    versions = {
        ["1.2.5"] = {},
    },
}
