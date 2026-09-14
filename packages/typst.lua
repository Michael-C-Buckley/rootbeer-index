return {
    name = "typst",
    description = "Create documents with the Typst typesetting system",
    default_version = "0.15.1",
    source = {
        github = "typst/typst",
        tag = "v{version}",
        repository_id = 210702427,
        assets = {
            ["aarch64-linux"] = "typst-aarch64-unknown-linux-musl.tar.xz",
            ["aarch64-macos"] = "typst-aarch64-apple-darwin.tar.xz",
            ["x86_64-linux"] = "typst-x86_64-unknown-linux-musl.tar.xz",
        },
    },
    bins = { "typst" },
    checks = {
        { "typst", "--version" },
        { "typst", "fonts", "--ignore-system-fonts" },
    },
    versions = {
        ["0.15.1"] = { revision = 2 },
    },
}
