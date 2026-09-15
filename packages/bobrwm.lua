return {
    schema = 2,
    name = "bobrwm",
    description = "Tiling window manager for macOS",
    default_version = "0.1.0-main+572265d",
    homepage = "https://github.com/bobrwm/bobrwm",
    systems = { "aarch64-macos" },
    inputs = {
        prebuilt = {
            github = "bobrwm/bobrwm",
            tag = "tip",
            assets = {
                ["aarch64-macos"] = "bobrwm-tip-34830670144-1-aarch64-macos.zip",
            },
            mirror = true,
        },
    },
    outputs = {
        bins = { "bobrwm" },
        bin_paths = {
            bobrwm = "Bobrwm.app/Contents/MacOS/bobrwm-cli",
        },
        apps = {
            ["Bobrwm.app"] = "Bobrwm.app",
        },
        checks = { { "bobrwm", "--version" }, { "bobrwm", "--help" } },
    },
    versions = {
        ["0.1.0-main+572265d"] = {
            revision = 2,
            inputs = {
                prebuilt = {
                    checksums = {
                        ["aarch64-macos"] = "6694c250d7ad887b26013abf1ddbfdaff9d99143a310f9111c97f3493ad396ac",
                    },
                },
            },
        },
    },
}
