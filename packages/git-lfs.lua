return {
    schema = 2,
    name = "git-lfs",
    description = "Store large files in Git repositories",
    default_version = "3.8.0",
    homepage = "https://github.com/git-lfs/git-lfs",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    upstream = {
        github = "git-lfs/git-lfs",
        repository_id = 13021798,
        tag_prefix = "v",
        exclude_tags = { "v0.5.4-homebrew" },
    },
    inputs = {
        prebuilt = {
            github = "git-lfs/git-lfs",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "git-lfs-linux-amd64-{tag}.tar.gz",
                ["aarch64-macos"] = "git-lfs-darwin-arm64-{tag}.zip",
                ["aarch64-linux"] = "git-lfs-linux-arm64-{tag}.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "git-lfs" },
        checks = { { "git-lfs", "version" } },
    },
    versions = {
        ["3.8.0"] = {
            revision = 2,
        },
    },
}
