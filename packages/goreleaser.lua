return {
    name = "goreleaser",
    description = "Build and package software releases",
    default_version = "2.18.1",
    source = {
        github = "goreleaser/goreleaser",
        tag = "v{version}",
        repository_id = 77071454,
        assets = {
            ["aarch64-linux"] = "goreleaser_Linux_arm64.tar.gz",
            ["aarch64-macos"] = "goreleaser_Darwin_arm64.tar.gz",
            ["x86_64-linux"] = "goreleaser_Linux_x86_64.tar.gz",
            ["x86_64-macos"] = "goreleaser_Darwin_x86_64.tar.gz",
        },
    },
    bins = { "goreleaser" },
    checks = {
        { "goreleaser", "--version" },
        { "goreleaser", "build", "--help" },
    },
    versions = {
        ["2.18.1"] = {},
    },
}
