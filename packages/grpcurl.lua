return {
    name = "grpcurl",
    description = "Call gRPC services from the command line",
    default_version = "1.9.4",
    source = {
        github = "fullstorydev/grpcurl",
        tag = "v{version}",
        repository_id = 111431261,
        assets = {
            ["aarch64-linux"] = "grpcurl_{version}_linux_arm64.tar.gz",
            ["aarch64-macos"] = "grpcurl_{version}_osx_arm64.tar.gz",
            ["x86_64-linux"] = "grpcurl_{version}_linux_x86_64.tar.gz",
        },
    },
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    bins = { "grpcurl" },
    checks = {
        { "grpcurl", "-version" },
    },
    versions = {
        ["1.9.4"] = { revision = 2 },
    },
}
