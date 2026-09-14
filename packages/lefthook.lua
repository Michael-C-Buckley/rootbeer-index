return {
    name = "lefthook",
    description = "Run Git hooks",
    default_version = "2.1.12",
    source = {
        github = "evilmartians/lefthook",
        tag = "v{version}",
        repository_id = 169250119,
        assets = {
            ["aarch64-linux"] = "lefthook_{version}_Linux_arm64",
            ["aarch64-macos"] = "lefthook_{version}_MacOS_arm64",
            ["x86_64-linux"] = "lefthook_{version}_Linux_x86_64",
            ["x86_64-macos"] = "lefthook_{version}_MacOS_x86_64",
        },
    },
    bins = { "lefthook" },
    checks = {
        { "lefthook", "version" },
        { "lefthook", "help" },
    },
    versions = {
        ["2.1.12"] = {},
    },
}
