return {
    schema = 2,
    name = "zlib",
    description = "Deflate compression library",
    default_version = "1.3.2",
    homepage = "https://zlib.net/",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    build = {
        steps = {
            check = { { "make", "test" } },
            configure = { { "/bin/sh", "./configure", "--prefix=/", "--static" } },
            install = { { "make", "DESTDIR={prefix}", "install" } },
            build = { { "make", "-j{jobs}" } },
        },
        backend = "custom",
    },
    inputs = {
        source = {
            url = "https://github.com/madler/zlib/releases/download/v1.3.2/zlib-1.3.2.tar.gz",
            archive = "tar.gz",
            strip_prefix = "zlib-1.3.2",
        },
    },
    outputs = {
        libraries = { "lib/libz.a" },
        bins = {},
        checks = {},
    },
    versions = {
        ["1.3.2"] = {
            inputs = {
                source = {
                    sha256 = "bb329a0a2cd0274d05519d61c667c062e06990d72e125ee2dfa8de64f0119d16",
                },
            },
        },
    },
}
