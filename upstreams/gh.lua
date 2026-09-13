return {
    ["name"] = "gh",
    ["repository"] = "cli/cli",
    ["repository_id"] = 212613049,
    ["description"] = "Work with GitHub from the command line",
    ["homepage"] = "https://github.com/cli/cli",
    ["systems"] = {
        "aarch64-linux",
        "aarch64-macos",
        "x86_64-linux",
        "x86_64-macos",
    },
    ["assets"] = {
        ["aarch64-linux"] = "gh_{version}_linux_arm64.tar.gz",
        ["aarch64-macos"] = "gh_{version}_macOS_arm64.zip",
        ["x86_64-linux"] = "gh_{version}_linux_amd64.tar.gz",
        ["x86_64-macos"] = "gh_{version}_macOS_amd64.zip",
    },
    ["bins"] = {
        "gh",
    },
    ["checks"] = {
        {
            "gh",
            "--version",
        },
    },
}
