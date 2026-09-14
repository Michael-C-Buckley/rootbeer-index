return {
    name = "glow",
    description = "Read Markdown in the terminal",
    default_version = "3.0.0",
    source = {
        github = "charmbracelet/glow",
        tag = "v{version}",
        repository_id = 219616873,
        assets = {
            ["aarch64-linux"] = "glow_{version}_Linux_arm64.tar.gz",
            ["aarch64-macos"] = "glow_{version}_Darwin_arm64.tar.gz",
            ["x86_64-linux"] = "glow_{version}_Linux_x86_64.tar.gz",
            ["x86_64-macos"] = "glow_{version}_Darwin_x86_64.tar.gz",
        },
    },
    bins = { "glow" },
    checks = {
        { "glow", "--version" },
        { "glow", "--help" },
    },
    versions = {
        ["3.0.0"] = {},
    },
}
