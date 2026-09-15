return {
    name = "lz4",
    description = "Fast compression library and command-line tools",
    homepage = "https://lz4.org/",
    default_version = "1.10.0",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    bins = { "lz4", "lz4c", "lz4cat", "unlz4" },
    checks = {
        { "lz4", "--version" },
        { "lz4c", "--version" },
        { "lz4cat", "--version" },
        { "unlz4", "--version" },
    },
    build = {
        backend = "commands",
        url = "https://github.com/lz4/lz4/releases/download/v1.10.0/lz4-1.10.0.tar.gz",
        archive = "tar.gz",
        strip_prefix = "lz4-1.10.0",
        libraries = { "lib/liblz4.a" },
        steps = {
            configure = {},
            build = { { "make", "-j{jobs}", "BUILD_SHARED=no", "PREFIX=/" } },
            check = { { "make", "BUILD_SHARED=no", "PREFIX=/", "test" } },
            install = { { "make", "BUILD_SHARED=no", "PREFIX=/", "DESTDIR={prefix}", "install" } },
        },
    },
    versions = {
        ["1.10.0"] = { sha256 = "537512904744b35e232912055ccf8ec66d768639ff3abe5788d90d792ec5f48b" },
    },
}
