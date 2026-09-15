return {
    schema = 2,
    name = "glow",
    description = "Read Markdown in the terminal",
    default_version = "3.0.0",
    homepage = "https://github.com/charmbracelet/glow",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "charmbracelet/glow",
        repository_id = 219616873,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "charmbracelet/glow",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "glow_{version}_Linux_x86_64.tar.gz",
                ["aarch64-macos"] = "glow_{version}_Darwin_arm64.tar.gz",
                ["aarch64-linux"] = "glow_{version}_Linux_arm64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "glow" },
        checks = { { "glow", "--version" }, { "glow", "--help" } },
    },
    versions = {
        ["3.0.0"] = {
            revision = 2,
        },
    },
}
