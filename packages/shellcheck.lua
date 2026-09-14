return {
    name = "shellcheck",
    description = "Find bugs in shell scripts",
    default_version = "0.11.0",
    source = {
        github = "koalaman/shellcheck",
        tag = "v{version}",
        repository_id = 6731432,
        assets = {
            ["aarch64-linux"] = "shellcheck-{tag}.linux.aarch64.tar.gz",
            ["aarch64-macos"] = "shellcheck-{tag}.darwin.aarch64.tar.gz",
            ["x86_64-linux"] = "shellcheck-{tag}.linux.x86_64.tar.gz",
        },
    },
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    bins = { "shellcheck" },
    checks = {
        { "shellcheck", "--version" },
    },
    versions = {
        ["0.11.0"] = { revision = 2 },
    },
}
