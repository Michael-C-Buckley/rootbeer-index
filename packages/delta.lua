return {
    schema = 2,
    name = "delta",
    description = "Display readable diffs",
    default_version = "0.19.2",
    default_versions = {},
    homepage = "https://github.com/dandavison/delta",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    upstream = {
        github = "dandavison/delta",
        repository_id = 193526915,
        tag_prefix = "",
    },
    inputs = {
        prebuilt = {
            github = "dandavison/delta",
            tag = "{version}",
            assets = {
                ["x86_64-linux"] = "delta-{tag}-x86_64-unknown-linux-musl.tar.gz",
                ["aarch64-macos"] = "delta-{tag}-aarch64-apple-darwin.tar.gz",
                ["aarch64-linux"] = "delta-{tag}-aarch64-unknown-linux-gnu.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "delta" },
        checks = { { "delta", "--version" } },
    },
    versions = {
        ["0.19.2"] = {
            systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
        },
        ["0.18.2"] = {
            revision = 2,
        },
    },
}
