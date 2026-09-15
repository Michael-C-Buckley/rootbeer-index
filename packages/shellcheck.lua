return {
    schema = 2,
    name = "shellcheck",
    description = "Find bugs in shell scripts",
    default_version = "0.11.0",
    homepage = "https://github.com/koalaman/shellcheck",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "koalaman/shellcheck",
        repository_id = 6731432,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "koalaman/shellcheck",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "shellcheck-{tag}.linux.x86_64.tar.gz",
                ["aarch64-macos"] = "shellcheck-{tag}.darwin.aarch64.tar.gz",
                ["aarch64-linux"] = "shellcheck-{tag}.linux.aarch64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "shellcheck" },
        checks = { { "shellcheck", "--version" } },
    },
    versions = {
        ["0.11.0"] = {
            revision = 2,
        },
    },
}
