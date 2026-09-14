return {
    name = "procs",
    description = "View and search running processes",
    default_version = "0.14.12",
    source = {
        github = "dalance/procs",
        tag = "v{version}",
        repository_id = 167957539,
        assets = {
            ["aarch64-linux"] = "procs-{tag}-aarch64-linux.zip",
            ["aarch64-macos"] = "procs-{tag}-aarch64-mac.zip",
            ["x86_64-linux"] = "procs-{tag}-x86_64-linux.zip",
            ["x86_64-macos"] = "procs-{tag}-x86_64-mac.zip",
        },
    },
    bins = { "procs" },
    checks = {
        { "procs", "--version" },
        { "procs", "--help" },
    },
    versions = {
        ["0.14.12"] = {},
    },
}
