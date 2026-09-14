return {
    name = "tealdeer",
    aliases = { "tldr" },
    description = "Read concise command-line usage examples",
    homepage = "https://docs.tealdeer.org",
    default_version = "1.9.0",
    source = {
        github = "tealdeer-rs/tealdeer",
        tag = "v{version}",
        repository_id = 48739367,
        assets = {
            ["aarch64-linux"] = "tealdeer-linux-aarch64-musl",
            ["aarch64-macos"] = "tealdeer-macos-aarch64",
            ["x86_64-linux"] = "tealdeer-linux-x86_64-musl",
            ["x86_64-macos"] = "tealdeer-macos-x86_64",
        },
    },
    bins = { "tldr" },
    checks = {
        { "tldr", "--version" },
    },
    versions = {
        ["1.9.0"] = {},
    },
}
