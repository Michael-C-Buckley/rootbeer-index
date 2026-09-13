return {
    ["name"] = "duf",
    ["repository"] = "muesli/duf",
    ["repository_id"] = 297165998,
    ["description"] = "Inspect filesystem disk usage",
    ["homepage"] = "https://github.com/muesli/duf",
    ["systems"] = {
        "aarch64-linux",
        "aarch64-macos",
        "x86_64-linux",
        "x86_64-macos",
    },
    ["assets"] = {
        ["aarch64-linux"] = "duf_{version}_linux_arm64.tar.gz",
        ["aarch64-macos"] = "duf_{version}_darwin_arm64.tar.gz",
        ["x86_64-linux"] = "duf_{version}_linux_x86_64.tar.gz",
        ["x86_64-macos"] = "duf_{version}_darwin_x86_64.tar.gz",
    },
    ["bins"] = {
        "duf",
    },
    ["checks"] = {
        {
            "duf",
            "--version",
        },
    },
}
