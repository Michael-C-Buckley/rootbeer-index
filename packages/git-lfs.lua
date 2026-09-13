return {
    name = "git-lfs",
    description = "Store large files in Git repositories",
    default_version = "3.8.0",
    source = {
        github = "git-lfs/git-lfs",
        tag = "v{version}",
        repository_id = 13021798,
        exclude_tags = { "v0.5.4-homebrew" },
        assets = {
            ["aarch64-linux"] = "git-lfs-linux-arm64-{tag}.tar.gz",
            ["aarch64-macos"] = "git-lfs-darwin-arm64-{tag}.zip",
            ["x86_64-linux"] = "git-lfs-linux-amd64-{tag}.tar.gz",
            ["x86_64-macos"] = "git-lfs-darwin-amd64-{tag}.zip",
        },
    },
    systems = { "aarch64-macos", "x86_64-macos", "aarch64-linux", "x86_64-linux" },
    bins = { "git-lfs" },
    checks = {
        { "git-lfs", "version" },
    },
    versions = {
        ["3.8.0"] = {},
    },
}
