return {
    schema = 2,
    name = "openssl",
    description = "TLS and cryptography libraries and tools",
    default_version = "4.0.2",
    homepage = "https://openssl-library.org/",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    build = {
        steps = {
            check = { { "/usr/bin/env", "HARNESS_JOBS={jobs}", "make", "test" } },
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
            install = { { "make", "DESTDIR={prefix}", "install_sw" } },
            build = { { "make", "-j{jobs}" } },
        },
        backend = "custom",
    },
    inputs = {
        source = {
            url = "https://github.com/openssl/openssl/releases/download/openssl-4.0.2/openssl-4.0.2.tar.gz",
            archive = "tar.gz",
            strip_prefix = "openssl-4.0.2",
        },
    },
    outputs = {
        libraries = { "lib/libssl.a", "lib/libcrypto.a" },
        bins = { "openssl" },
        checks = {
            { "openssl", "version", "-a" },
            { "openssl", "list", "-providers", "-provider", "default", "-provider", "legacy" },
            { "openssl", "dgst", "-sha256" },
        },
    },
    versions = {
        ["4.0.2"] = {
            inputs = {
                source = {
                    sha256 = "736b467530f916737b7031310ccb21d8218c6229e61e8e160cd1d3458cd543a8",
                },
            },
        },
    },
}
