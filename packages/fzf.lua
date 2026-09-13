return {
    name = "fzf",
    description = "Find and select text interactively",
    default_version = "0.74.4",
    source = {
        github = "junegunn/fzf",
        tag = "v{version}",
        repository_id = 13807606,
        assets = {
            ["aarch64-linux"] = "fzf-{version}-linux_arm64.tar.gz",
            ["aarch64-macos"] = "fzf-{version}-darwin_arm64.tar.gz",
            ["x86_64-linux"] = "fzf-{version}-linux_amd64.tar.gz",
            ["x86_64-macos"] = "fzf-{version}-darwin_amd64.tar.gz",
        },
    },
    systems = { "aarch64-macos", "x86_64-macos", "aarch64-linux", "x86_64-linux" },
    bins = { "fzf" },
    checks = {
        { "fzf", "--version" },
        { "fzf", "--bash" },
    },
    versions = {
        ["0.74.4"] = {},
    },
}
