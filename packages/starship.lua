return {
    name = "starship",
    description = "Configure shell prompts",
    homepage = "https://starship.rs",
    default_version = "1.26.0",
    source = {
        github = "starship/starship",
        tag = "v{version}",
        repository_id = 178991158,
        assets = {
            ["aarch64-linux"] = "starship-aarch64-unknown-linux-musl.tar.gz",
            ["aarch64-macos"] = "starship-aarch64-apple-darwin.tar.gz",
            ["x86_64-linux"] = "starship-x86_64-unknown-linux-musl.tar.gz",
            ["x86_64-macos"] = "starship-x86_64-apple-darwin.tar.gz",
        },
    },
    bins = { "starship" },
    checks = {
        { "starship", "--version" },
        { "starship", "init", "zsh" },
    },
    versions = {
        ["1.26.0"] = {},
    },
}
