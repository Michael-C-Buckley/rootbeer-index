return {
    schema = 2,
    name = "yazi",
    description = "Browse and manage files in the terminal",
    default_version = "26.9.1",
    homepage = "https://github.com/sxyazi/yazi",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "sxyazi/yazi",
        repository_id = 663900193,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "sxyazi/yazi",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "yazi-x86_64-unknown-linux-musl.zip",
                ["aarch64-macos"] = "yazi-aarch64-apple-darwin.zip",
                ["aarch64-linux"] = "yazi-aarch64-unknown-linux-musl.zip",
            },
        },
    },
    outputs = {
        bins = { "yazi", "ya" },
        checks = { { "yazi", "--version" }, { "ya", "--version" }, { "ya", "--help" } },
    },
    versions = {
        ["26.9.1"] = {
            revision = 2,
        },
    },
}
