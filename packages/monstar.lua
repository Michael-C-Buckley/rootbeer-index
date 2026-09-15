return {
    schema = 2,
    name = "monstar",
    description = "Run a CPU-rendered Wayland terminal",
    default_version = "1.0.1",
    homepage = "https://github.com/rockorager/monstar",
    systems = { "x86_64-linux" },
    upstream = {
        github = "rockorager/monstar",
        repository_id = 1287637631,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "rockorager/monstar",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "monstar-{version}-x86_64-linux.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "monstar" },
        checks = { { "monstar", "--version" }, { "monstar", "--help" }, { "monstar", "--bench" } },
    },
    versions = {
        ["1.0.1"] = {},
    },
}
