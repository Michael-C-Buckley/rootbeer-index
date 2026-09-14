return {
    name = "monstar",
    description = "Run a CPU-rendered Wayland terminal",
    default_version = "1.0.1",
    source = {
        github = "rockorager/monstar",
        tag = "v{version}",
        repository_id = 1287637631,
        assets = {
            ["x86_64-linux"] = "monstar-{version}-x86_64-linux.tar.gz",
        },
    },
    bins = { "monstar" },
    checks = {
        { "monstar", "--version" },
        { "monstar", "--help" },
        { "monstar", "--bench" },
    },
    versions = {
        ["1.0.1"] = {},
    },
}
