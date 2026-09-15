return {
    schema = 2,
    name = "fastfetch",
    description = "Display system information",
    default_version = "2.68.1",
    homepage = "https://github.com/fastfetch-cli/fastfetch",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "fastfetch-cli/fastfetch",
        repository_id = 340181518,
        tag_prefix = "",
    },
    inputs = {
        prebuilt = {
            github = "fastfetch-cli/fastfetch",
            tag = "{version}",
            assets = {
                ["x86_64-linux"] = "fastfetch-linux-amd64.tar.gz",
                ["aarch64-macos"] = "fastfetch-macos-aarch64.tar.gz",
                ["aarch64-linux"] = "fastfetch-linux-aarch64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "fastfetch" },
        checks = { { "fastfetch", "--version" } },
    },
    versions = {
        ["2.68.1"] = {
            revision = 2,
        },
    },
}
