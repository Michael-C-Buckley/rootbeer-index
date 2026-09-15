return {
    schema = 2,
    name = "mkcert",
    description = "Create locally trusted development certificates",
    default_version = "1.4.4",
    homepage = "https://github.com/FiloSottile/mkcert",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    upstream = {
        github = "FiloSottile/mkcert",
        repository_id = 138547797,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "FiloSottile/mkcert",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "mkcert-{tag}-linux-amd64",
                ["aarch64-macos"] = "mkcert-{tag}-darwin-arm64",
                ["aarch64-linux"] = "mkcert-{tag}-linux-arm64",
            },
        },
    },
    outputs = {
        bins = { "mkcert" },
        checks = { { "mkcert", "--version" } },
    },
    versions = {
        ["1.4.4"] = {
            revision = 2,
        },
    },
}
