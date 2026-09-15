return {
    schema = 2,
    name = "doggo",
    description = "Look up DNS records from the terminal",
    default_version = "1.4.0",
    homepage = "https://github.com/mr-karan/doggo",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "mr-karan/doggo",
        repository_id = 319848237,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "mr-karan/doggo",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "doggo-linux-x86_64.tar.gz",
                ["aarch64-macos"] = "doggo-darwin-aarch64.tar.gz",
                ["aarch64-linux"] = "doggo-linux-aarch64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "doggo" },
        checks = { { "doggo", "--version" }, { "doggo", "--help" } },
    },
    versions = {
        ["1.4.0"] = {
            revision = 2,
        },
    },
}
