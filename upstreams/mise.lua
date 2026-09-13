return {
    ["name"] = "mise",
    ["repository"] = "jdx/mise",
    ["repository_id"] = 586920414,
    ["description"] = "Manage development tools and tasks",
    ["homepage"] = "https://github.com/jdx/mise",
    ["systems"] = {
        "aarch64-linux",
        "aarch64-macos",
        "x86_64-linux",
        "x86_64-macos",
    },
    ["assets"] = {
        ["aarch64-linux"] = "mise-{tag}-linux-arm64-musl.tar.gz",
        ["aarch64-macos"] = "mise-{tag}-macos-arm64.tar.gz",
        ["x86_64-linux"] = "mise-{tag}-linux-x64-musl.tar.gz",
        ["x86_64-macos"] = "mise-{tag}-macos-x64.tar.gz",
    },
    ["bins"] = {
        "mise",
    },
    ["checks"] = {
        {
            "mise",
            "--version",
        },
    },
}
