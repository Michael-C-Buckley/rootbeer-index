return {
    name = "bobrwm",
    description = "Tiling window manager for macOS",
    default_version = "0.1.0-main+572265d",
    source = {
        github = "bobrwm/bobrwm",
        repository_id = 999844138,
        tag = "tip",
        track = false,
        assets = {
            ["aarch64-macos"] = "bobrwm-tip-34830670144-1-aarch64-macos.zip",
        },
    },
    bins = { "bobrwm" },
    bin_paths = {
        bobrwm = "Bobrwm.app/Contents/MacOS/bobrwm-cli",
    },
    apps = { ["Bobrwm.app"] = "Bobrwm.app" },
    mirror = true,
    checks = {
        { "bobrwm", "--version" },
        { "bobrwm", "--help" },
    },
    versions = {
        ["0.1.0-main+572265d"] = {
            revision = 2,
            checksums = {
                ["aarch64-macos"] = "6694c250d7ad887b26013abf1ddbfdaff9d99143a310f9111c97f3493ad396ac",
            },
        },
    },
}
