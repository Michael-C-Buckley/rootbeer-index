return {
    ["name"] = "age",
    ["repository"] = "FiloSottile/age",
    ["repository_id"] = 187403699,
    ["description"] = "File encryption with explicit recipients",
    ["homepage"] = "https://age-encryption.org/",
    ["systems"] = {
        "aarch64-linux",
        "aarch64-macos",
        "x86_64-linux",
        "x86_64-macos",
    },
    ["assets"] = {
        ["aarch64-linux"] = "age-{tag}-linux-arm64.tar.gz",
        ["aarch64-macos"] = "age-{tag}-darwin-arm64.tar.gz",
        ["x86_64-linux"] = "age-{tag}-linux-amd64.tar.gz",
        ["x86_64-macos"] = "age-{tag}-darwin-amd64.tar.gz",
    },
    ["bins"] = {
        "age",
        "age-keygen",
    },
    ["checks"] = {
        {
            "age",
            "--version",
        },
        {
            "age-keygen",
            "--version",
        },
    },
}
