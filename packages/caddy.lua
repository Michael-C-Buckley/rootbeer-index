return {
    name = "caddy",
    description = "Serve HTTP with automatic HTTPS",
    default_version = "2.11.4",
    source = {
        github = "caddyserver/caddy",
        tag = "v{version}",
        repository_id = 29207621,
        assets = {
            ["aarch64-linux"] = "caddy_{version}_linux_arm64.tar.gz",
            ["aarch64-macos"] = "caddy_{version}_mac_arm64.tar.gz",
            ["x86_64-linux"] = "caddy_{version}_linux_amd64.tar.gz",
            ["x86_64-macos"] = "caddy_{version}_mac_amd64.tar.gz",
        },
    },
    bins = { "caddy" },
    checks = {
        { "caddy", "version" },
        { "caddy", "list-modules" },
    },
    versions = {
        ["2.11.4"] = {},
    },
}
