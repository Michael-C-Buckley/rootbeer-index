return {
    schema = 2,
    name = "zmx",
    description = "Persist terminal sessions",
    default_version = "0.8.1",
    homepage = "https://github.com/neurosnap/zmx",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "neurosnap/zmx",
        repository_id = 1073900202,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "neurosnap/zmx",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "zmx-{version}-linux-x86_64.tar.gz",
                ["aarch64-macos"] = "zmx-{version}-macos-aarch64.tar.gz",
                ["aarch64-linux"] = "zmx-{version}-linux-aarch64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "zmx" },
        checks = { { "zmx", "version" } },
    },
    versions = {
        ["0.8.1"] = {
            revision = 2,
        },
    },
}
