return {
    name = "openssl",
    description = "TLS and cryptography libraries and tools",
    homepage = "https://openssl-library.org/",
    default_version = "4.0.2",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    bins = { "openssl" },
    checks = {
        { "openssl", "version", "-a" },
        { "openssl", "list", "-providers", "-provider", "default", "-provider", "legacy" },
        { "openssl", "dgst", "-sha256" },
    },
    build = {
        backend = "commands",
        url = "https://github.com/openssl/openssl/releases/download/openssl-4.0.2/openssl-4.0.2.tar.gz",
        archive = "tar.gz",
        strip_prefix = "openssl-4.0.2",
        libraries = { "lib/libssl.a", "lib/libcrypto.a" },
        steps = {
            configure = {
                {
                    "perl",
                    "./Configure",
                    "--prefix=/",
                    "--libdir=lib",
                    "--openssldir=/etc/ssl",
                    "no-shared",
                    "no-module",
                },
            },
            build = { { "make", "-j{jobs}" } },
            check = { { "/usr/bin/env", "HARNESS_JOBS={jobs}", "make", "test" } },
            install = { { "make", "DESTDIR={prefix}", "install_sw" } },
        },
    },
    versions = {
        ["4.0.2"] = { sha256 = "736b467530f916737b7031310ccb21d8218c6229e61e8e160cd1d3458cd543a8" },
    },
}
