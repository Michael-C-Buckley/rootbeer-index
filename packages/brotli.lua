return {
    schema = 2,
    name = "brotli",
    description = "Brotli compression library and command-line tool",
    default_version = "1.2.0",
    homepage = "https://github.com/google/brotli",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    build = {
        steps = {
            check = {
                {
                    "ctest",
                    "--test-dir",
                    "build",
                    "--output-on-failure",
                    "--no-tests=error",
                    "--parallel",
                    "{jobs}",
                },
            },
            configure = {
                {
                    "curl",
                    "--fail",
                    "--location",
                    "--retry",
                    "3",
                    "--output",
                    "testdata.txz",
                    "https://github.com/google/brotli/releases/download/v1.2.0/testdata.txz",
                },
                {
                    "/bin/sh",
                    "-ec",
                    "printf '%s  %s\\n' e8624d888f13067e7635353397cf42956bf4ca1382da67f9cec8d43e800deecb testdata.txz | shasum -a 256 -c -",
                },
                { "tar", "-xJf", "testdata.txz" },
                {
                    "cmake",
                    "-S",
                    ".",
                    "-B",
                    "build",
                    "-DCMAKE_BUILD_TYPE=Release",
                    "-DBUILD_SHARED_LIBS=OFF",
                    "-DBROTLI_DISABLE_TESTS=OFF",
                    "-DCMAKE_INSTALL_PREFIX=/",
                    "-DCMAKE_INSTALL_BINDIR=/bin",
                    "-DCMAKE_INSTALL_LIBDIR=/lib",
                    "-DCMAKE_INSTALL_INCLUDEDIR=/include",
                },
            },
            install = { { "/usr/bin/env", "DESTDIR={prefix}", "cmake", "--install", "build" } },
            build = { { "cmake", "--build", "build", "--parallel", "{jobs}" } },
        },
        dependencies = { "cmake@4.4.3" },
        backend = "custom",
    },
    inputs = {
        source = {
            url = "https://github.com/google/brotli/archive/refs/tags/v1.2.0.tar.gz",
            archive = "tar.gz",
            strip_prefix = "brotli-1.2.0",
        },
    },
    outputs = {
        libraries = { "lib/libbrotlicommon.a", "lib/libbrotlidec.a", "lib/libbrotlienc.a" },
        bins = { "brotli" },
        checks = { { "brotli", "--version" } },
    },
    versions = {
        ["1.2.0"] = {
            inputs = {
                source = {
                    sha256 = "816c96e8e8f193b40151dad7e8ff37b1221d019dbcb9c35cd3fadbfe6477dfec",
                },
            },
        },
    },
}
