return {
    name = "jq",
    description = "Query and transform JSON",
    default_version = "1.8.2",
    source = {
        github = "jqlang/jq",
        tag = "jq-{version}",
        repository_id = 5101141,
        assets = {
            ["aarch64-linux"] = "jq-linux-arm64",
            ["aarch64-macos"] = "jq-macos-arm64",
            ["x86_64-linux"] = "jq-linux-amd64",
        },
    },
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    bins = { "jq" },
    checks = {
        { "jq", "--version" },
        { "jq", "--null-input", "--exit-status", "[1,2,3] | add == 6" },
    },
    versions = {
        ["1.8.2"] = { revision = 2 },
    },
}
