return {
    schema = 2,
    name = "mise",
    description = "Manage development tools and tasks",
    default_version = "2026.9.7",
    homepage = "https://github.com/jdx/mise",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    upstream = {
        github = "jdx/mise",
        repository_id = 586920414,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "jdx/mise",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "mise-{tag}-linux-x64-musl.tar.gz",
                ["aarch64-macos"] = "mise-{tag}-macos-arm64.tar.gz",
                ["aarch64-linux"] = "mise-{tag}-linux-arm64-musl.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "mise" },
        checks = { { "mise", "--version" } },
    },
    versions = {
        ["2026.9.5"] = {
            revision = 2,
        },
        ["2026.9.6"] = {
            revision = 2,
            systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
        },
        ["2026.9.7"] = {
            revision = 2,
            systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
        },
    },
}
