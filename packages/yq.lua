return {
    schema = 2,
    name = "yq",
    description = "Query and transform structured data",
    default_version = "4.53.6",
    homepage = "https://mikefarah.gitbook.io/yq/",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "mikefarah/yq",
        repository_id = 43225113,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "mikefarah/yq",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "yq_linux_amd64",
                ["aarch64-macos"] = "yq_darwin_arm64",
                ["aarch64-linux"] = "yq_linux_arm64",
            },
        },
    },
    outputs = {
        bins = { "yq" },
        checks = { { "yq", "--version" }, { "yq", "--null-input", "--exit-status", "1 + 2 == 3" } },
    },
    versions = {
        ["4.53.6"] = {
            revision = 2,
        },
    },
}
