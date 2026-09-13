return {
    ["name"] = "rage",
    ["repository"] = "str4d/rage",
    ["repository_id"] = 213749542,
    ["description"] = "Encrypt files using the age format",
    ["homepage"] = "https://github.com/str4d/rage",
    ["systems"] = {
        "aarch64-linux",
        "aarch64-macos",
        "x86_64-linux",
        "x86_64-macos",
    },
    ["assets"] = {
        ["aarch64-linux"] = "rage-{tag}-arm64-linux.tar.gz",
        ["aarch64-macos"] = "rage-{tag}-arm64-darwin.tar.gz",
        ["x86_64-linux"] = "rage-{tag}-x86_64-linux.tar.gz",
        ["x86_64-macos"] = "rage-{tag}-x86_64-darwin.tar.gz",
    },
    ["bins"] = {
        "rage",
        "rage-keygen",
    },
    ["checks"] = {
        {
            "rage",
            "--version",
        },
        {
            "rage-keygen",
            "--version",
        },
    },
}
