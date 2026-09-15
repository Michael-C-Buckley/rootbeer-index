return {
    name = "zlib",
    description = "Deflate compression library",
    homepage = "https://zlib.net/",
    default_version = "1.3.2",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    bins = {},
    checks = {},
    build = {
        backend = "commands",
        url = "https://github.com/madler/zlib/releases/download/v1.3.2/zlib-1.3.2.tar.gz",
        archive = "tar.gz",
        strip_prefix = "zlib-1.3.2",
        libraries = { "lib/libz.a" },
        steps = {
            configure = { { "/bin/sh", "./configure", "--prefix=/", "--static" } },
            build = { { "make", "-j{jobs}" } },
            check = { { "make", "test" } },
            install = { { "make", "DESTDIR={prefix}", "install" } },
        },
    },
    versions = {
        ["1.3.2"] = { sha256 = "bb329a0a2cd0274d05519d61c667c062e06990d72e125ee2dfa8de64f0119d16" },
    },
}
