return {
    name = "tilt",
    description = "Develop applications running in Kubernetes",
    default_version = "0.37.7",
    source = {
        github = "tilt-dev/tilt",
        tag = "v{version}",
        repository_id = 143896900,
        assets = {
            ["aarch64-linux"] = "tilt.{version}.linux.arm64.tar.gz",
            ["aarch64-macos"] = "tilt.{version}.mac.arm64.tar.gz",
            ["x86_64-linux"] = "tilt.{version}.linux.x86_64.tar.gz",
        },
    },
    bins = { "tilt" },
    checks = {
        { "tilt", "version" },
    },
    versions = {
        ["0.37.7"] = { revision = 2 },
    },
}
