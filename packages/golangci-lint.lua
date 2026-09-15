return {
    schema = 2,
    name = "golangci-lint",
    description = "Run Go linters",
    default_version = "2.13.2",
    homepage = "https://github.com/golangci/golangci-lint",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "golangci/golangci-lint",
        repository_id = 132145189,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "golangci/golangci-lint",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "golangci-lint-{version}-linux-amd64.tar.gz",
                ["aarch64-macos"] = "golangci-lint-{version}-darwin-arm64.tar.gz",
                ["aarch64-linux"] = "golangci-lint-{version}-linux-arm64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "golangci-lint" },
        checks = { { "golangci-lint", "version" }, { "golangci-lint", "help", "linters" } },
    },
    versions = {
        ["2.13.2"] = {
            revision = 2,
        },
    },
}
