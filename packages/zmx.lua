return {
    name = "zmx",
    description = "Persist terminal sessions",
    default_version = "0.8.1",
    source = {
        github = "neurosnap/zmx",
        tag = "v{version}",
        repository_id = 1073900202,
        assets = {
            ["aarch64-linux"] = "zmx-{version}-linux-aarch64.tar.gz",
            ["aarch64-macos"] = "zmx-{version}-macos-aarch64.tar.gz",
            ["x86_64-linux"] = "zmx-{version}-linux-x86_64.tar.gz",
        },
    },
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    bins = { "zmx" },
    checks = {
        { "zmx", "version" },
    },
    versions = {
        ["0.8.1"] = { revision = 2 },
    },
}
