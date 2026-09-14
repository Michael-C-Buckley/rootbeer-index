return {
    name = "gum",
    description = "Build interactive shell scripts",
    default_version = "2.0.1",
    source = {
        github = "charmbracelet/gum",
        tag = "v{version}",
        repository_id = 502193049,
        assets = {
            ["aarch64-linux"] = "gum_{version}_Linux_arm64.tar.gz",
            ["aarch64-macos"] = "gum_{version}_Darwin_arm64.tar.gz",
            ["x86_64-linux"] = "gum_{version}_Linux_x86_64.tar.gz",
        },
    },
    bins = { "gum" },
    checks = {
        { "gum", "--version" },
        { "gum", "format", "hello" },
    },
    versions = {
        ["2.0.1"] = { revision = 2 },
    },
}
