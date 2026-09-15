return {
    schema = 2,
    name = "miniserve",
    description = "Serve a directory over HTTP",
    default_version = "0.35.0",
    homepage = "https://github.com/svenstaro/miniserve",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "svenstaro/miniserve",
        repository_id = 131135585,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "svenstaro/miniserve",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "miniserve-{version}-x86_64-unknown-linux-musl",
                ["aarch64-macos"] = "miniserve-{version}-aarch64-apple-darwin",
                ["aarch64-linux"] = "miniserve-{version}-aarch64-unknown-linux-musl",
            },
        },
    },
    outputs = {
        bins = { "miniserve" },
        checks = { { "miniserve", "--version" }, { "miniserve", "--help" } },
    },
    versions = {
        ["0.35.0"] = {
            revision = 2,
        },
    },
}
