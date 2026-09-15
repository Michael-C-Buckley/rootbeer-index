return {
    schema = 2,
    name = "grpcurl",
    description = "Call gRPC services from the command line",
    default_version = "1.9.4",
    homepage = "https://github.com/fullstorydev/grpcurl",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "fullstorydev/grpcurl",
        repository_id = 111431261,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "fullstorydev/grpcurl",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "grpcurl_{version}_linux_x86_64.tar.gz",
                ["aarch64-macos"] = "grpcurl_{version}_osx_arm64.tar.gz",
                ["aarch64-linux"] = "grpcurl_{version}_linux_arm64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "grpcurl" },
        checks = { { "grpcurl", "-version" } },
    },
    versions = {
        ["1.9.4"] = {
            revision = 2,
        },
    },
}
