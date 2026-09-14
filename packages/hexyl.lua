return {
    name = "hexyl",
    description = "View binary files in hexadecimal",
    default_version = "0.17.0",
    source = {
        github = "sharkdp/hexyl",
        tag = "v{version}",
        repository_id = 156294298,
        assets = {
            ["aarch64-linux"] = "hexyl-{tag}-aarch64-unknown-linux-gnu.tar.gz",
            ["aarch64-macos"] = "hexyl-{tag}-aarch64-apple-darwin.tar.gz",
            ["x86_64-linux"] = "hexyl-{tag}-x86_64-unknown-linux-musl.tar.gz",
        },
    },
    bins = { "hexyl" },
    checks = {
        { "hexyl", "--version" },
        { "hexyl", "--help" },
    },
    versions = {
        ["0.17.0"] = { revision = 2 },
    },
}
