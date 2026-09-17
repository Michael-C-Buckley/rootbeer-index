return {
    schema = 2,
    name = "xxhash",
    description = "Fast non-cryptographic hashing library and checksum tool",
    default_version = "0.8.3",
    homepage = "https://xxhash.com/",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    upstream = {
        github = "Cyan4973/xxHash",
        tag_prefix = "v",
    },
    build = {
        backend = "custom",
        steps = {
            configure = {},
            build = { { "make", "-j{jobs}", "libxxhash.a", "xxhsum" } },
            check = { { "make", "check" } },
            install = {
                {
                    "make",
                    "PREFIX=/",
                    "DESTDIR={prefix}",
                    "install_libxxhash.a",
                    "install_libxxhash.includes",
                    "install_libxxhash.pc",
                    "install_xxhsum",
                    "install_man",
                },
            },
        },
    },
    inputs = {
        source = {
            url = "https://github.com/Cyan4973/xxHash/archive/refs/tags/v{version}.tar.gz",
            archive = "tar.gz",
            strip_prefix = "xxHash-{version}",
        },
    },
    outputs = {
        libraries = { "lib/libxxhash.a" },
        bins = { "xxhsum" },
        checks = { { "xxhsum", "--version" } },
    },
    versions = {
        ["0.8.3"] = {
            inputs = {
                source = {
                    sha256 = "aae608dfe8213dfd05d909a57718ef82f30722c392344583d3f39050c7f29a80",
                },
            },
        },
    },
}
