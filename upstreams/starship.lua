return {
    ["name"] = "starship",
    ["repository"] = "starship/starship",
    ["repository_id"] = 178991158,
    ["description"] = "Configure shell prompts",
    ["homepage"] = "https://starship.rs",
    ["systems"] = {
        "aarch64-linux",
        "aarch64-macos",
        "x86_64-linux",
        "x86_64-macos",
    },
    ["assets"] = {
        ["aarch64-linux"] = "starship-aarch64-unknown-linux-musl.tar.gz",
        ["aarch64-macos"] = "starship-aarch64-apple-darwin.tar.gz",
        ["x86_64-linux"] = "starship-x86_64-unknown-linux-musl.tar.gz",
        ["x86_64-macos"] = "starship-x86_64-apple-darwin.tar.gz",
    },
    ["bins"] = {
        "starship",
    },
    ["checks"] = {
        {
            "starship",
            "--version",
        },
        {
            "starship",
            "init",
            "zsh",
        },
    },
}
