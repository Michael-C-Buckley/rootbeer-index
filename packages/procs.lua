return {
    schema = 2,
    name = "procs",
    description = "View and search running processes",
    default_version = "0.14.12",
    homepage = "https://github.com/dalance/procs",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "dalance/procs",
        repository_id = 167957539,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "dalance/procs",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "procs-{tag}-x86_64-linux.zip",
                ["aarch64-macos"] = "procs-{tag}-aarch64-mac.zip",
                ["aarch64-linux"] = "procs-{tag}-aarch64-linux.zip",
            },
        },
    },
    outputs = {
        bins = { "procs" },
        checks = { { "procs", "--version" }, { "procs", "--help" } },
    },
    versions = {
        ["0.14.12"] = {
            revision = 2,
        },
    },
}
