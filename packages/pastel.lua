return {
    name = "pastel",
    description = "Generate and transform colors",
    default_version = "0.12.0",
    source = {
        github = "sharkdp/pastel",
        tag = "v{version}",
        repository_id = 189867161,
        assets = {
            ["aarch64-linux"] = "pastel-{tag}-aarch64-unknown-linux-gnu.tar.gz",
            ["aarch64-macos"] = "pastel-{tag}-aarch64-apple-darwin.tar.gz",
            ["x86_64-linux"] = "pastel-{tag}-x86_64-unknown-linux-musl.tar.gz",
            ["x86_64-macos"] = "pastel-{tag}-x86_64-apple-darwin.tar.gz",
        },
    },
    bins = { "pastel" },
    checks = {
        { "pastel", "--version" },
        { "pastel", "format", "hex", "red" },
    },
    versions = {
        ["0.12.0"] = {},
    },
}
