return {
    name = "fastfetch",
    description = "Display system information",
    default_version = "2.68.1",
    source = {
        github = "fastfetch-cli/fastfetch",
        tag = "{version}",
        repository_id = 340181518,
        assets = {
            ["aarch64-linux"] = "fastfetch-linux-aarch64.tar.gz",
            ["aarch64-macos"] = "fastfetch-macos-aarch64.tar.gz",
            ["x86_64-linux"] = "fastfetch-linux-amd64.tar.gz",
            ["x86_64-macos"] = "fastfetch-macos-amd64.tar.gz",
        },
    },
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux", "x86_64-macos" },
    bins = { "fastfetch" },
    checks = {
        { "fastfetch", "--version" },
    },
    versions = {
        ["2.68.1"] = {},
    },
}
