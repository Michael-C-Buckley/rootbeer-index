return {
    name = "age",
    description = "File encryption with explicit recipients",
    homepage = "https://age-encryption.org/",
    default_version = "1.3.2",
    source = {
        github = "FiloSottile/age",
        tag = "v{version}",
        repository_id = 187403699,
        assets = {
            ["aarch64-linux"] = "age-{tag}-linux-arm64.tar.gz",
            ["aarch64-macos"] = "age-{tag}-darwin-arm64.tar.gz",
            ["x86_64-linux"] = "age-{tag}-linux-amd64.tar.gz",
            ["x86_64-macos"] = "age-{tag}-darwin-amd64.tar.gz",
        },
    },
    systems = { "aarch64-macos", "x86_64-macos", "aarch64-linux", "x86_64-linux" },
    bins = { "age", "age-keygen" },
    checks = {
        { "age", "--version" },
        { "age-keygen", "--version" },
    },
    versions = {
        ["1.3.1"] = {
            revision = 2,
        },
        ["1.3.2"] = {
            systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux", "x86_64-macos" },
        },
    },
}
