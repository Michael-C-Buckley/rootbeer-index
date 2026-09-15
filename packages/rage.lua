return {
    schema = 2,
    name = "rage",
    description = "Encrypt files using the age format",
    default_version = "0.12.1",
    homepage = "https://github.com/str4d/rage",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    upstream = {
        github = "str4d/rage",
        repository_id = 213749542,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "str4d/rage",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "rage-{tag}-x86_64-linux.tar.gz",
                ["aarch64-macos"] = "rage-{tag}-arm64-darwin.tar.gz",
                ["aarch64-linux"] = "rage-{tag}-arm64-linux.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "rage", "rage-keygen" },
        checks = { { "rage", "--version" }, { "rage-keygen", "--version" } },
    },
    versions = {
        ["0.12.1"] = {
            revision = 2,
        },
    },
}
