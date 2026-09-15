return {
    schema = 2,
    name = "xz",
    description = "Compress and decompress XZ streams",
    default_version = "5.8.3",
    homepage = "https://tukaani.org/xz/",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    build = {
        configure = {
            "--disable-shared",
            "--enable-static",
            "--disable-nls",
            "--disable-scripts",
            "--disable-doc",
        },
        backend = "autotools",
    },
    inputs = {
        source = {
            url = "https://github.com/tukaani-project/xz/releases/download/v{version}/xz-{version}.tar.gz",
            archive = "tar.gz",
            strip_prefix = "xz-{version}",
        },
    },
    outputs = {
        libraries = { "lib/liblzma.a" },
        bins = { "xz", "xzdec", "lzmadec", "lzmainfo" },
        checks = {
            { "xz", "--version" },
            { "xzdec", "--version" },
            { "lzmadec", "--version" },
            { "lzmainfo", "--version" },
        },
    },
    versions = {
        ["5.8.3"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "3d3a1b973af218114f4f889bbaa2f4c037deaae0c8e815eec381c3d546b974a0",
                },
            },
        },
    },
}
