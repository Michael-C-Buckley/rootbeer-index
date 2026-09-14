return {
    name = "yazi",
    description = "Browse and manage files in the terminal",
    default_version = "26.9.1",
    source = {
        github = "sxyazi/yazi",
        tag = "v{version}",
        repository_id = 663900193,
        assets = {
            ["aarch64-linux"] = "yazi-aarch64-unknown-linux-musl.zip",
            ["aarch64-macos"] = "yazi-aarch64-apple-darwin.zip",
            ["x86_64-linux"] = "yazi-x86_64-unknown-linux-musl.zip",
            ["x86_64-macos"] = "yazi-x86_64-apple-darwin.zip",
        },
    },
    bins = { "yazi", "ya" },
    checks = {
        { "yazi", "--version" },
        { "ya", "--version" },
        { "ya", "--help" },
    },
    versions = {
        ["26.9.1"] = {},
    },
}
