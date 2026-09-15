return {
    schema = 2,
    name = "jq",
    description = "Query and transform JSON",
    default_version = "1.8.2",
    homepage = "https://github.com/jqlang/jq",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    upstream = {
        github = "jqlang/jq",
        repository_id = 5101141,
        tag_prefix = "jq-",
    },
    inputs = {
        prebuilt = {
            github = "jqlang/jq",
            tag = "jq-{version}",
            assets = {
                ["x86_64-linux"] = "jq-linux-amd64",
                ["aarch64-macos"] = "jq-macos-arm64",
                ["aarch64-linux"] = "jq-linux-arm64",
            },
        },
    },
    outputs = {
        bins = { "jq" },
        checks = {
            { "jq", "--version" },
            { "jq", "--null-input", "--exit-status", "[1,2,3] | add == 6" },
        },
    },
    versions = {
        ["1.8.2"] = {
            revision = 2,
        },
    },
}
