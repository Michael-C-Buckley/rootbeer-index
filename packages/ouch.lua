return {
    schema = 2,
    name = "ouch",
    description = "Compress and extract archives",
    default_version = "0.8.3",
    homepage = "https://github.com/ouch-org/ouch",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "ouch-org/ouch",
        repository_id = 349334268,
        tag_prefix = "",
    },
    inputs = {
        prebuilt = {
            github = "ouch-org/ouch",
            tag = "{version}",
            assets = {
                ["x86_64-linux"] = "ouch-x86_64-unknown-linux-musl.tar.gz",
                ["aarch64-macos"] = "ouch-aarch64-apple-darwin.tar.gz",
                ["aarch64-linux"] = "ouch-aarch64-unknown-linux-musl.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "ouch" },
        checks = { { "ouch", "--version" }, { "ouch", "--help" } },
    },
    versions = {
        ["0.8.3"] = {
            revision = 2,
        },
    },
}
