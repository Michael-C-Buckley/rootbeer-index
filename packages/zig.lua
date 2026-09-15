return {
    schema = 2,
    name = "zig",
    description = "Build software with the Zig programming language and toolchain",
    default_version = "0.16.0",
    homepage = "https://ziglang.org",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    inputs = {
        prebuilt = {
            aqua = "ziglang/zig",
            tag = "0.16.0",
        },
    },
    outputs = {
        bins = { "zig" },
        checks = { { "zig", "version" } },
    },
    versions = {
        ["0.16.0"] = {
            revision = 2,
            systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
            inputs = {
                prebuilt = {
                    aqua = "ziglang/zig",
                    tag = "0.16.0",
                },
            },
            outputs = {
                bins = { "zig" },
                checks = { { "zig", "version" } },
            },
        },
    },
}
