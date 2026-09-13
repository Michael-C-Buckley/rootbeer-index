return {
    ["name"] = "jq",
    ["repository"] = "jqlang/jq",
    ["repository_id"] = 5101141,
    ["description"] = "Query and transform JSON",
    ["homepage"] = "https://github.com/jqlang/jq",
    ["tag_prefix"] = "jq-",
    ["systems"] = {
        "aarch64-linux",
        "aarch64-macos",
        "x86_64-linux",
        "x86_64-macos",
    },
    ["assets"] = {
        ["aarch64-linux"] = "jq-linux-arm64",
        ["aarch64-macos"] = "jq-macos-arm64",
        ["x86_64-linux"] = "jq-linux-amd64",
        ["x86_64-macos"] = "jq-macos-amd64",
    },
    ["bins"] = {
        "jq",
    },
    ["checks"] = {
        {
            "jq",
            "--version",
        },
        {
            "jq",
            "--null-input",
            "--exit-status",
            "[1,2,3] | add == 6",
        },
    },
}
