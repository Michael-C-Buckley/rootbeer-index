return {
    schema = 2,
    name = "xxhash",
    description = "Fast non-cryptographic hashing library and checksum tool",
    homepage = "https://xxhash.com/",
    default_version = "0.8.4",
    upstream = {
        github = "Cyan4973/xxHash",
        repository_id = 19330466,
        tag_prefix = "v",
        systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    },
    inputs = {
        source = {
            url = "https://github.com/Cyan4973/xxHash/archive/refs/tags/v{version}.tar.gz",
            archive = "tar.gz",
            strip_prefix = "xxHash-{version}",
        },
    },
    build = {
        backend = "custom",
        steps = {
            configure = {},
            build = {
                { "make", "-j{jobs}", "libxxhash.a", "xxhsum" },
            },
            check = {
                { "make", "check" },
            },
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
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    outputs = {
        bins = { "xxhsum" },
        libraries = { "lib/libxxhash.a" },
        checks = {
            { "xxhsum", "--version" },
        },
    },
    versions = {
        ["0.8.3"] = {
            inputs = {
                source = {
                    sha256 = "aae608dfe8213dfd05d909a57718ef82f30722c392344583d3f39050c7f29a80",
                },
            },
        },
        ["0.8.4"] = {
            inputs = {
                source = {
                    sha256 = "5738270935e7c3d38a79b3adf7c9692566ce7895a25f67de43ad52ab504acd32",
                },
            },
            systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
        },
    },
}
