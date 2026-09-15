return {
    schema = 2,
    name = "starship",
    description = "Configure shell prompts",
    default_version = "1.26.0",
    homepage = "https://starship.rs",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "starship/starship",
        repository_id = 178991158,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "starship/starship",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "starship-x86_64-unknown-linux-musl.tar.gz",
                ["aarch64-macos"] = "starship-aarch64-apple-darwin.tar.gz",
                ["aarch64-linux"] = "starship-aarch64-unknown-linux-musl.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "starship" },
        checks = { { "starship", "--version" }, { "starship", "init", "zsh" } },
    },
    versions = {
        ["1.26.0"] = {
            revision = 2,
        },
    },
}
