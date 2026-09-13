return {
    ["name"] = "fzf",
    ["repository"] = "junegunn/fzf",
    ["repository_id"] = 13807606,
    ["description"] = "Find and select text interactively",
    ["homepage"] = "https://github.com/junegunn/fzf",
    ["systems"] = {
        "aarch64-linux",
        "aarch64-macos",
        "x86_64-linux",
        "x86_64-macos",
    },
    ["assets"] = {
        ["aarch64-linux"] = "fzf-{version}-linux_arm64.tar.gz",
        ["aarch64-macos"] = "fzf-{version}-darwin_arm64.tar.gz",
        ["x86_64-linux"] = "fzf-{version}-linux_amd64.tar.gz",
        ["x86_64-macos"] = "fzf-{version}-darwin_amd64.tar.gz",
    },
    ["bins"] = {
        "fzf",
    },
    ["checks"] = {
        {
            "fzf",
            "--version",
        },
        {
            "fzf",
            "--bash",
        },
    },
}
