return {
    schema = 2,
    name = "fzf",
    description = "Find and select text interactively",
    default_version = "0.74.4",
    homepage = "https://github.com/junegunn/fzf",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    upstream = {
        github = "junegunn/fzf",
        repository_id = 13807606,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "junegunn/fzf",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "fzf-{version}-linux_amd64.tar.gz",
                ["aarch64-macos"] = "fzf-{version}-darwin_arm64.tar.gz",
                ["aarch64-linux"] = "fzf-{version}-linux_arm64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "fzf" },
        checks = { { "fzf", "--version" }, { "fzf", "--bash" } },
    },
    versions = {
        ["0.74.4"] = {
            revision = 2,
        },
    },
}
