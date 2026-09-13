return {
    ["name"] = "git-lfs",
    ["repository"] = "git-lfs/git-lfs",
    ["repository_id"] = 13021798,
    ["description"] = "Store large files in Git repositories",
    ["homepage"] = "https://github.com/git-lfs/git-lfs",
    ["exclude_tags"] = {
        "v0.5.4-homebrew",
    },
    ["systems"] = {
        "aarch64-linux",
        "aarch64-macos",
        "x86_64-linux",
        "x86_64-macos",
    },
    ["assets"] = {
        ["aarch64-linux"] = "git-lfs-linux-arm64-{tag}.tar.gz",
        ["aarch64-macos"] = "git-lfs-darwin-arm64-{tag}.zip",
        ["x86_64-linux"] = "git-lfs-linux-amd64-{tag}.tar.gz",
        ["x86_64-macos"] = "git-lfs-darwin-amd64-{tag}.zip",
    },
    ["bins"] = {
        "git-lfs",
    },
    ["checks"] = {
        {
            "git-lfs",
            "version",
        },
    },
}
