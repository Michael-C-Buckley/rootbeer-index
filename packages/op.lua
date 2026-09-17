return {
    schema = 2,
    name = "op",
    description = "Access 1Password from the command line",
    default_version = "2.39.0",
    homepage = "https://developer.1password.com/docs/cli/",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    inputs = {
        prebuilt = {
            aqua = "1password/cli",
            tag = "v{version}",
        },
    },
    outputs = {
        bins = { "op" },
        checks = { { "op", "--version" }, { "op", "--help" } },
    },
    versions = {
        ["2.39.0"] = {},
    },
}
