return {
    name = "docker-compose",
    description = "Define and run multi-container Docker applications",
    homepage = "https://docs.docker.com/compose/",
    default_version = "5.5.1",
    source = {
        github = "docker/compose",
        tag = "v{version}",
        repository_id = 15045751,
        assets = {
            ["aarch64-linux"] = "docker-compose-linux-aarch64",
            ["aarch64-macos"] = "docker-compose-darwin-aarch64",
            ["x86_64-linux"] = "docker-compose-linux-x86_64",
        },
    },
    bins = { "docker-compose" },
    checks = {
        { "docker-compose", "version", "--short" },
    },
    versions = {
        ["5.5.1"] = { revision = 2 },
    },
}
