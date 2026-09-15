return {
    schema = 2,
    name = "pkgconf",
    description = "Resolve compiler and linker flags for library dependencies",
    default_version = "3.0.7",
    homepage = "https://github.com/pkgconf/pkgconf",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    build = {
        steps = {
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
            install = {
                { "make", "DESTDIR={prefix}", "install" },
                { "/bin/ln", "-s", "pkgconf", "{prefix}/bin/pkg-config" },
            },
            build = { { "make", "-j{jobs}" } },
        },
        backend = "custom",
    },
    inputs = {
        source = {
            url = "https://distfiles.ariadne.space/pkgconf/pkgconf-3.0.7.tar.xz",
            archive = "tar.xz",
            strip_prefix = "pkgconf-3.0.7",
        },
    },
    outputs = {
        bins = { "pkgconf", "pkg-config" },
        checks = {
            { "pkgconf", "--version" },
            { "pkg-config", "--version" },
            { "pkg-config", "--atleast-pkgconfig-version=3.0.7" },
        },
    },
    versions = {
        ["3.0.7"] = {
            inputs = {
                source = {
                    sha256 = "c926ff491cbd9a331a589160811bd97ab1749b4d5198a519338f2cdfabe6940a",
                },
            },
        },
    },
}
