return {
    schema = 2,
    name = "docker-compose",
    description = "Define and run multi-container Docker applications",
    default_version = "5.5.1",
    homepage = "https://docs.docker.com/compose/",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "docker/compose",
        repository_id = 15045751,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "docker/compose",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "docker-compose-linux-x86_64",
                ["aarch64-macos"] = "docker-compose-darwin-aarch64",
                ["aarch64-linux"] = "docker-compose-linux-aarch64",
            },
        },
    },
    outputs = {
        bins = { "docker-compose" },
        checks = { { "docker-compose", "version", "--short" } },
    },
    versions = {
        ["5.5.1"] = {
            revision = 2,
        },
    },
}
