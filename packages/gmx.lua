return {
    schema = 2,
    name = "gmx",
    description = "Manage Ghostty terminal sessions",
    default_version = "0.1.10",
    homepage = "https://github.com/nicosuave/gmx",
    systems = { "aarch64-macos" },
    upstream = {
        github = "nicosuave/gmx",
        repository_id = 1183476144,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "nicosuave/gmx",
            tag = "v{version}",
            assets = {
                ["aarch64-macos"] = "gmx-{version}-macos-arm64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "gmx" },
        checks = { { "gmx", "--help" }, { "gmx", "completions", "zsh" } },
    },
    versions = {
        ["0.1.10"] = {
            revision = 2,
        },
    },
}
