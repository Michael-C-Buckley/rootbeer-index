return {
    name = "zellij",
    description = "Manage terminal workspaces and sessions",
    default_version = "0.45.1",
    source = {
        github = "zellij-org/zellij",
        tag = "v{version}",
        repository_id = 292014229,
        assets = {
            ["aarch64-linux"] = "zellij-aarch64-unknown-linux-musl.tar.gz",
            ["aarch64-macos"] = "zellij-aarch64-apple-darwin.tar.gz",
            ["x86_64-linux"] = "zellij-x86_64-unknown-linux-musl.tar.gz",
            ["x86_64-macos"] = "zellij-x86_64-apple-darwin.tar.gz",
        },
    },
    bins = { "zellij" },
    checks = {
        { "zellij", "--version" },
        { "zellij", "--help" },
    },
    versions = {
        ["0.45.1"] = {},
    },
}
