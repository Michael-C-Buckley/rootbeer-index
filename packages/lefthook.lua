return {
    schema = 2,
    name = "lefthook",
    description = "Run Git hooks",
    homepage = "https://github.com/evilmartians/lefthook",
    default_version = "2.1.14",
    upstream = {
        github = "evilmartians/lefthook",
        repository_id = 169250119,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "evilmartians/lefthook",
            tag = "v{version}",
            assets = {
                ["aarch64-linux"] = "lefthook_{version}_Linux_arm64",
                ["aarch64-macos"] = "lefthook_{version}_MacOS_arm64",
                ["x86_64-linux"] = "lefthook_{version}_Linux_x86_64",
            },
        },
    },
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    outputs = {
        bins = { "lefthook" },
        checks = {
            { "lefthook", "version" },
            { "lefthook", "help" },
        },
    },
    versions = {
        ["2.1.12"] = {
            revision = 2,
        },
        ["2.1.14"] = {},
    },
}
