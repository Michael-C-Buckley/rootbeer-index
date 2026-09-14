return {
    name = "miniserve",
    description = "Serve a directory over HTTP",
    default_version = "0.35.0",
    source = {
        github = "svenstaro/miniserve",
        tag = "v{version}",
        repository_id = 131135585,
        assets = {
            ["aarch64-linux"] = "miniserve-{version}-aarch64-unknown-linux-musl",
            ["aarch64-macos"] = "miniserve-{version}-aarch64-apple-darwin",
            ["x86_64-linux"] = "miniserve-{version}-x86_64-unknown-linux-musl",
        },
    },
    bins = { "miniserve" },
    checks = {
        { "miniserve", "--version" },
        { "miniserve", "--help" },
    },
    versions = {
        ["0.35.0"] = { revision = 2 },
    },
}
