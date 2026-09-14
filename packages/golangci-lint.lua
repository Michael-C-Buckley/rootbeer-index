return {
    name = "golangci-lint",
    description = "Run Go linters",
    default_version = "2.13.2",
    source = {
        github = "golangci/golangci-lint",
        tag = "v{version}",
        repository_id = 132145189,
        assets = {
            ["aarch64-linux"] = "golangci-lint-{version}-linux-arm64.tar.gz",
            ["aarch64-macos"] = "golangci-lint-{version}-darwin-arm64.tar.gz",
            ["x86_64-linux"] = "golangci-lint-{version}-linux-amd64.tar.gz",
        },
    },
    bins = { "golangci-lint" },
    checks = {
        { "golangci-lint", "version" },
        { "golangci-lint", "help", "linters" },
    },
    versions = {
        ["2.13.2"] = { revision = 2 },
    },
}
