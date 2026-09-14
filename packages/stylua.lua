return {
    name = "stylua",
    description = "Format Lua and Luau source code",
    default_version = "2.5.2",
    source = {
        github = "JohnnyMorganz/StyLua",
        tag = "v{version}",
        repository_id = 321792527,
        assets = {
            ["aarch64-linux"] = "stylua-linux-aarch64-musl.zip",
            ["aarch64-macos"] = "stylua-macos-aarch64.zip",
            ["x86_64-linux"] = "stylua-linux-x86_64-musl.zip",
        },
    },
    bins = { "stylua" },
    checks = {
        { "stylua", "--version" },
    },
    versions = {
        ["2.5.2"] = { revision = 2 },
    },
}
