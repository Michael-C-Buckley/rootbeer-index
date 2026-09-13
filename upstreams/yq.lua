return {
    ["name"] = "yq",
    ["repository"] = "mikefarah/yq",
    ["repository_id"] = 43225113,
    ["description"] = "Query and transform structured data",
    ["homepage"] = "https://mikefarah.gitbook.io/yq/",
    ["systems"] = {
        "aarch64-linux",
        "aarch64-macos",
        "x86_64-linux",
        "x86_64-macos",
    },
    ["assets"] = {
        ["aarch64-linux"] = "yq_linux_arm64",
        ["aarch64-macos"] = "yq_darwin_arm64",
        ["x86_64-linux"] = "yq_linux_amd64",
        ["x86_64-macos"] = "yq_darwin_amd64",
    },
    ["bins"] = {
        "yq",
    },
    ["checks"] = {
        {
            "yq",
            "--version",
        },
        {
            "yq",
            "--null-input",
            "--exit-status",
            "1 + 2 == 3",
        },
    },
}
