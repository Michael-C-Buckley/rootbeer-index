return {
    schema = 2,
    name = "gum",
    description = "Build interactive shell scripts",
    default_version = "2.0.1",
    homepage = "https://github.com/charmbracelet/gum",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "charmbracelet/gum",
        repository_id = 502193049,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "charmbracelet/gum",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "gum_{version}_Linux_x86_64.tar.gz",
                ["aarch64-macos"] = "gum_{version}_Darwin_arm64.tar.gz",
                ["aarch64-linux"] = "gum_{version}_Linux_arm64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "gum" },
        checks = { { "gum", "--version" }, { "gum", "format", "hello" } },
    },
    versions = {
        ["2.0.1"] = {
            revision = 2,
        },
    },
}
