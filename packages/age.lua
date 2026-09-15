return {
    schema = 2,
    name = "age",
    description = "File encryption with explicit recipients",
    default_version = "1.3.2",
    homepage = "https://age-encryption.org/",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    upstream = {
        github = "FiloSottile/age",
        repository_id = 187403699,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "FiloSottile/age",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "age-{tag}-linux-amd64.tar.gz",
                ["aarch64-macos"] = "age-{tag}-darwin-arm64.tar.gz",
                ["aarch64-linux"] = "age-{tag}-linux-arm64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "age", "age-keygen" },
        checks = { { "age", "--version" }, { "age-keygen", "--version" } },
    },
    versions = {
        ["1.3.2"] = {
            revision = 2,
            systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
        },
        ["1.3.1"] = {
            revision = 3,
        },
    },
}
