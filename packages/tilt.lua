return {
    schema = 2,
    name = "tilt",
    description = "Develop applications running in Kubernetes",
    default_version = "0.37.7",
    homepage = "https://github.com/tilt-dev/tilt",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "tilt-dev/tilt",
        repository_id = 143896900,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "tilt-dev/tilt",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "tilt.{version}.linux.x86_64.tar.gz",
                ["aarch64-macos"] = "tilt.{version}.mac.arm64.tar.gz",
                ["aarch64-linux"] = "tilt.{version}.linux.arm64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "tilt" },
        checks = { { "tilt", "version" } },
    },
    versions = {
        ["0.37.7"] = {
            revision = 2,
        },
    },
}
