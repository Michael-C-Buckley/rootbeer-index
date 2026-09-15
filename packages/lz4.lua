return {
    schema = 2,
    name = "lz4",
    description = "Fast compression library and command-line tools",
    default_version = "1.10.0",
    homepage = "https://lz4.org/",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    build = {
        steps = {
            check = { { "make", "BUILD_SHARED=no", "PREFIX=/", "test" } },
            configure = {
                {
                    "sed",
                    "-i.bak",
                    "-e",
                    "s/ffm = self.cvinfo.file_frame_map\\[i\\]/ffm = os.path.basename(self.cvinfo.file_frame_map[i])/",
                    "-e",
                    "s/if start != 0 and end != 0:/if end != 0:/",
                    "tests/test-lz4-list.py",
                },
            },
            install = { { "make", "BUILD_SHARED=no", "PREFIX=/", "DESTDIR={prefix}", "install" } },
            build = { { "make", "-j{jobs}", "BUILD_SHARED=no", "PREFIX=/" } },
        },
        backend = "custom",
    },
    inputs = {
        source = {
            url = "https://github.com/lz4/lz4/releases/download/v1.10.0/lz4-1.10.0.tar.gz",
            archive = "tar.gz",
            strip_prefix = "lz4-1.10.0",
        },
    },
    outputs = {
        libraries = { "lib/liblz4.a" },
        bins = { "lz4", "lz4c", "lz4cat", "unlz4" },
        checks = {
            { "lz4", "--version" },
            { "lz4c", "--version" },
            { "lz4cat", "--version" },
            { "unlz4", "--version" },
        },
    },
    versions = {
        ["1.10.0"] = {
            revision = 2,
            inputs = {
                source = {
                    sha256 = "537512904744b35e232912055ccf8ec66d768639ff3abe5788d90d792ec5f48b",
                },
            },
        },
    },
}
