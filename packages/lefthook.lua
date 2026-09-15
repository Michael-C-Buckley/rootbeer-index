return {
    schema = 2,
    name = "lefthook",
    description = "Run Git hooks",
    default_version = "2.1.12",
    homepage = "https://github.com/evilmartians/lefthook",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
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
                ["x86_64-linux"] = "lefthook_{version}_Linux_x86_64",
                ["aarch64-macos"] = "lefthook_{version}_MacOS_arm64",
                ["aarch64-linux"] = "lefthook_{version}_Linux_arm64",
            },
        },
    },
    outputs = {
        bins = { "lefthook" },
        checks = { { "lefthook", "version" }, { "lefthook", "help" } },
    },
    versions = {
        ["2.1.12"] = {
            revision = 2,
        },
    },
}
