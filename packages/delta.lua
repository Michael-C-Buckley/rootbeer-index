return {
    name = "delta",
    description = "Display readable diffs",
    default_version = "0.19.2",
    default_versions = {
        ["x86_64-macos"] = "0.18.2",
    },
    source = {
        github = "dandavison/delta",
        tag = "{version}",
        repository_id = 193526915,
        assets = {
            ["aarch64-linux"] = "delta-{tag}-aarch64-unknown-linux-gnu.tar.gz",
            ["aarch64-macos"] = "delta-{tag}-aarch64-apple-darwin.tar.gz",
            ["x86_64-linux"] = "delta-{tag}-x86_64-unknown-linux-musl.tar.gz",
            ["x86_64-macos"] = "delta-{tag}-x86_64-apple-darwin.tar.gz",
        },
    },
    systems = { "aarch64-macos", "x86_64-macos", "aarch64-linux", "x86_64-linux" },
    bins = { "delta" },
    checks = {
        { "delta", "--version" },
    },
    versions = {
        ["0.18.2"] = {},
        ["0.19.2"] = {
            systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
        },
    },
}
