return {
    name = "mise",
    description = "Manage development tools and tasks",
    default_version = "2026.9.7",
    source = {
        github = "jdx/mise",
        tag = "v{version}",
        repository_id = 586920414,
        assets = {
            ["aarch64-linux"] = "mise-{tag}-linux-arm64-musl.tar.gz",
            ["aarch64-macos"] = "mise-{tag}-macos-arm64.tar.gz",
            ["x86_64-linux"] = "mise-{tag}-linux-x64-musl.tar.gz",
            ["x86_64-macos"] = "mise-{tag}-macos-x64.tar.gz",
        },
    },
    systems = { "aarch64-macos", "x86_64-macos", "aarch64-linux", "x86_64-linux" },
    bins = { "mise" },
    checks = {
        { "mise", "--version" },
    },
    versions = {
        ["2026.9.5"] = {},
        ["2026.9.6"] = {
            systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux", "x86_64-macos" },
        },
        ["2026.9.7"] = {
            systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux", "x86_64-macos" },
        },
    },
}
