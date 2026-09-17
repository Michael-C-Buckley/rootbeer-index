return {
    schema = 2,
    name = "expat",
    description = "Parse XML with the Expat library",
    default_version = "2.8.4",
    homepage = "https://libexpat.github.io/",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    build = {
        backend = "autotools",
        configure = { "--disable-shared", "--enable-static", "--without-docbook", "--without-examples" },
    },
    inputs = {
        source = {
            url = "https://github.com/libexpat/libexpat/releases/download/R_2_8_4/expat-{version}.tar.xz",
            archive = "tar.xz",
            strip_prefix = "expat-{version}",
        },
    },
    outputs = {
        libraries = { "lib/libexpat.a" },
        bins = { "xmlwf" },
        checks = { { "xmlwf", "-v" } },
    },
    versions = {
        ["2.8.4"] = {
            inputs = {
                source = {
                    sha256 = "656ae1cc8da3b4ea513bb4e254f33e6243938084c0ec6239da873376b09985a7",
                },
            },
        },
    },
}
