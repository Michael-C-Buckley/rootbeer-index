return {
    name = "hyperfine",
    description = "Benchmark command execution",
    default_version = "1.20.0",
    source = {
        github = "sharkdp/hyperfine",
        tag = "v{version}",
        repository_id = 117356231,
        assets = {
            ["aarch64-linux"] = "hyperfine-{tag}-aarch64-unknown-linux-gnu.tar.gz",
            ["aarch64-macos"] = "hyperfine-{tag}-aarch64-apple-darwin.tar.gz",
            ["x86_64-linux"] = "hyperfine-{tag}-x86_64-unknown-linux-musl.tar.gz",
        },
    },
    bins = { "hyperfine" },
    checks = {
        { "hyperfine", "--version" },
    },
    versions = {
        ["1.20.0"] = { revision = 2 },
    },
}
