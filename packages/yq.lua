return {
    name = "yq",
    description = "Query and transform structured data",
    homepage = "https://mikefarah.gitbook.io/yq/",
    default_version = "4.53.6",
    source = {
        github = "mikefarah/yq",
        tag = "v{version}",
        repository_id = 43225113,
        assets = {
            ["aarch64-linux"] = "yq_linux_arm64",
            ["aarch64-macos"] = "yq_darwin_arm64",
            ["x86_64-linux"] = "yq_linux_amd64",
            ["x86_64-macos"] = "yq_darwin_amd64",
        },
    },
    bins = { "yq" },
    checks = {
        { "yq", "--version" },
        { "yq", "--null-input", "--exit-status", "1 + 2 == 3" },
    },
    versions = {
        ["4.53.6"] = {},
    },
}
