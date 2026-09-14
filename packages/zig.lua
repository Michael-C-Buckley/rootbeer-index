local systems = { "aarch64-macos", "x86_64-macos", "aarch64-linux", "x86_64-linux" }
local bins = { "zig" }
local checks = { { "zig", "version" } }

return {
    name = "zig",
    description = "Build software with the Zig programming language and toolchain",
    homepage = "https://ziglang.org",
    default_version = "0.16.0",
    versions = {
        ["0.16.0"] = {
            revision = 1,
            source = "aqua:ziglang/zig@0.16.0",
            systems = systems,
            bins = bins,
            checks = checks,
        },
    },
}
