return {
    name = "cosign",
    description = "Sign and verify container images and files",
    default_version = "3.1.3",
    source = {
        github = "sigstore/cosign",
        tag = "v{version}",
        repository_id = 335952417,
        assets = {
            ["aarch64-linux"] = "cosign-linux-arm64",
            ["aarch64-macos"] = "cosign-darwin-arm64",
            ["x86_64-linux"] = "cosign-linux-amd64",
            ["x86_64-macos"] = "cosign-darwin-amd64",
        },
    },
    bins = { "cosign" },
    checks = {
        { "cosign", "version" },
        { "cosign", "verify", "--help" },
    },
    versions = {
        ["3.1.3"] = {},
    },
}
