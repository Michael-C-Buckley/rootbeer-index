return {
    name = "rage",
    description = "Encrypt files using the age format",
    default_version = "0.12.1",
    source = {
        github = "str4d/rage",
        tag = "v{version}",
        repository_id = 213749542,
        assets = {
            ["aarch64-linux"] = "rage-{tag}-arm64-linux.tar.gz",
            ["aarch64-macos"] = "rage-{tag}-arm64-darwin.tar.gz",
            ["x86_64-linux"] = "rage-{tag}-x86_64-linux.tar.gz",
        },
    },
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    bins = { "rage", "rage-keygen" },
    checks = {
        { "rage", "--version" },
        { "rage-keygen", "--version" },
    },
    versions = {
        ["0.12.1"] = { revision = 2 },
    },
}
