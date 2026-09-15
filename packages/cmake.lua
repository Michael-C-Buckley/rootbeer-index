return {
    name = "cmake",
    description = "Configure, build, test, and package software",
    homepage = "https://cmake.org/",
    default_version = "4.4.3",
    source = {
        github = "Kitware/CMake",
        tag = "v{version}",
        repository_id = 537699,
        assets = {
            ["aarch64-macos"] = "cmake-{version}-macos-universal.tar.gz",
            ["aarch64-linux"] = "cmake-{version}-linux-aarch64.tar.gz",
            ["x86_64-linux"] = "cmake-{version}-linux-x86_64.tar.gz",
        },
    },
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    bins = { "cmake", "ctest", "cpack" },
    checks = {
        { "cmake", "--version" },
        { "cmake", "-E", "capabilities" },
        { "cmake", "--system-information" },
        { "ctest", "--version" },
        { "cpack", "--version" },
    },
    versions = { ["4.4.3"] = { revision = 1 } },
}
