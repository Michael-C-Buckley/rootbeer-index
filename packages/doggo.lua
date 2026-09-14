return {
    name = "doggo",
    description = "Look up DNS records from the terminal",
    default_version = "1.4.0",
    source = {
        github = "mr-karan/doggo",
        tag = "v{version}",
        repository_id = 319848237,
        assets = {
            ["aarch64-linux"] = "doggo-linux-aarch64.tar.gz",
            ["aarch64-macos"] = "doggo-darwin-aarch64.tar.gz",
            ["x86_64-linux"] = "doggo-linux-x86_64.tar.gz",
            ["x86_64-macos"] = "doggo-darwin-x86_64.tar.gz",
        },
    },
    bins = { "doggo" },
    checks = {
        { "doggo", "--version" },
        { "doggo", "--help" },
    },
    versions = {
        ["1.4.0"] = {},
    },
}
