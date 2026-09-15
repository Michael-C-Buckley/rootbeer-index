return {
    schema = 2,
    name = "cosign",
    description = "Sign and verify container images and files",
    default_version = "3.1.3",
    homepage = "https://github.com/sigstore/cosign",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "sigstore/cosign",
        repository_id = 335952417,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "sigstore/cosign",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "cosign-linux-amd64",
                ["aarch64-macos"] = "cosign-darwin-arm64",
                ["aarch64-linux"] = "cosign-linux-arm64",
            },
        },
    },
    outputs = {
        bins = { "cosign" },
        checks = { { "cosign", "version" }, { "cosign", "verify", "--help" } },
    },
    versions = {
        ["3.1.3"] = {
            revision = 2,
        },
    },
}
