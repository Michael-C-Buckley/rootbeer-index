return {
    ["name"] = "mkcert",
    ["repository"] = "FiloSottile/mkcert",
    ["repository_id"] = 138547797,
    ["description"] = "Create locally trusted development certificates",
    ["homepage"] = "https://github.com/FiloSottile/mkcert",
    ["systems"] = {
        "aarch64-linux",
        "aarch64-macos",
        "x86_64-linux",
        "x86_64-macos",
    },
    ["assets"] = {
        ["aarch64-linux"] = "mkcert-{tag}-linux-arm64",
        ["aarch64-macos"] = "mkcert-{tag}-darwin-arm64",
        ["x86_64-linux"] = "mkcert-{tag}-linux-amd64",
        ["x86_64-macos"] = "mkcert-{tag}-darwin-amd64",
    },
    ["bins"] = {
        "mkcert",
    },
    ["checks"] = {
        {
            "mkcert",
            "--version",
        },
    },
}
