return {
    schema = 2,
    name = "goreleaser",
    description = "Build and package software releases",
    default_version = "2.18.1",
    homepage = "https://github.com/goreleaser/goreleaser",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "goreleaser/goreleaser",
        repository_id = 77071454,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "goreleaser/goreleaser",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "goreleaser_Linux_x86_64.tar.gz",
                ["aarch64-macos"] = "goreleaser_Darwin_arm64.tar.gz",
                ["aarch64-linux"] = "goreleaser_Linux_arm64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "goreleaser" },
        checks = { { "goreleaser", "--version" }, { "goreleaser", "build", "--help" } },
    },
    versions = {
        ["2.18.1"] = {
            revision = 2,
        },
    },
}
