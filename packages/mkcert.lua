return {
    name = "mkcert",
    description = "Create locally trusted development certificates",
    default_version = "1.4.4",
    source = {
        github = "FiloSottile/mkcert",
        tag = "v{version}",
        repository_id = 138547797,
        assets = {
            ["aarch64-linux"] = "mkcert-{tag}-linux-arm64",
            ["aarch64-macos"] = "mkcert-{tag}-darwin-arm64",
            ["x86_64-linux"] = "mkcert-{tag}-linux-amd64",
            ["x86_64-macos"] = "mkcert-{tag}-darwin-amd64",
        },
    },
    systems = { "aarch64-macos", "x86_64-macos", "aarch64-linux", "x86_64-linux" },
    bins = { "mkcert" },
    checks = {
        { "mkcert", "--version" },
    },
    versions = {
        ["1.4.4"] = {},
    },
}
