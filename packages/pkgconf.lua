return {
    name = "pkgconf",
    description = "Resolve compiler and linker flags for library dependencies",
    homepage = "https://github.com/pkgconf/pkgconf",
    default_version = "3.0.7",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    bins = { "pkgconf", "pkg-config" },
    checks = {
        { "pkgconf", "--version" },
        { "pkg-config", "--version" },
        { "pkg-config", "--atleast-pkgconfig-version=3.0.7" },
    },
    build = {
        backend = "commands",
        url = "https://distfiles.ariadne.space/pkgconf/pkgconf-3.0.7.tar.xz",
        archive = "tar.xz",
        strip_prefix = "pkgconf-3.0.7",
        steps = {
            configure = {
                {
                    "/bin/sh",
                    "./configure",
                    "--prefix=/",
                    "--disable-shared",
                    "--enable-static",
                    "--with-pkg-config-dir=/usr/local/lib/pkgconfig:/usr/local/share/pkgconfig:/usr/lib/pkgconfig:/usr/share/pkgconfig",
                },
            },
            build = { { "make", "-j{jobs}" } },
            check = {
                {
                    "/usr/bin/env",
                    "-u",
                    "PKG_CONFIG_SYSROOT_DIR",
                    "-u",
                    "PKG_CONFIG_PATH",
                    "PKG_CONFIG_LIBDIR=.",
                    "/bin/sh",
                    "-c",
                    "exec make check",
                },
            },
            install = {
                { "make", "DESTDIR={prefix}", "install" },
                { "/bin/ln", "-s", "pkgconf", "{prefix}/bin/pkg-config" },
            },
        },
    },
    versions = {
        ["3.0.7"] = { sha256 = "c926ff491cbd9a331a589160811bd97ab1749b4d5198a519338f2cdfabe6940a" },
    },
}
