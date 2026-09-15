return {
    schema = 2,
    name = "typst",
    description = "Create documents with the Typst typesetting system",
    default_version = "0.15.1",
    homepage = "https://github.com/typst/typst",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "typst/typst",
        repository_id = 210702427,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "typst/typst",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "typst-x86_64-unknown-linux-musl.tar.xz",
                ["aarch64-macos"] = "typst-aarch64-apple-darwin.tar.xz",
                ["aarch64-linux"] = "typst-aarch64-unknown-linux-musl.tar.xz",
            },
        },
    },
    outputs = {
        bins = { "typst" },
        checks = { { "typst", "--version" }, { "typst", "fonts", "--ignore-system-fonts" } },
    },
    versions = {
        ["0.15.1"] = {
            revision = 2,
        },
    },
}
