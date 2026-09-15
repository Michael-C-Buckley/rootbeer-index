return {
    schema = 2,
    name = "caddy",
    description = "Serve HTTP with automatic HTTPS",
    default_version = "2.11.4",
    homepage = "https://github.com/caddyserver/caddy",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "caddyserver/caddy",
        repository_id = 29207621,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "caddyserver/caddy",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "caddy_{version}_linux_amd64.tar.gz",
                ["aarch64-macos"] = "caddy_{version}_mac_arm64.tar.gz",
                ["aarch64-linux"] = "caddy_{version}_linux_arm64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "caddy" },
        checks = { { "caddy", "version" }, { "caddy", "list-modules" } },
    },
    versions = {
        ["2.11.4"] = {
            revision = 2,
        },
    },
}
