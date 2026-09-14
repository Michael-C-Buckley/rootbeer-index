return {
    name = "gmx",
    description = "Manage Ghostty terminal sessions",
    default_version = "0.1.10",
    source = {
        github = "nicosuave/gmx",
        tag = "v{version}",
        repository_id = 1183476144,
        assets = {
            ["aarch64-macos"] = "gmx-{version}-macos-arm64.tar.gz",
            ["x86_64-macos"] = "gmx-{version}-macos-x86_64.tar.gz",
        },
    },
    systems = { "aarch64-macos", "x86_64-macos" },
    bins = { "gmx" },
    checks = {
        { "gmx", "--help" },
        { "gmx", "completions", "zsh" },
    },
    versions = {
        ["0.1.10"] = {},
    },
}
