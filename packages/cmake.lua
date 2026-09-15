return {
    schema = 2,
    name = "cmake",
    description = "Configure, build, test, and package software",
    default_version = "4.4.3",
    homepage = "https://cmake.org/",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    upstream = {
        github = "Kitware/CMake",
        repository_id = 537699,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "Kitware/CMake",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "cmake-{version}-linux-x86_64.tar.gz",
                ["aarch64-macos"] = "cmake-{version}-macos-universal.tar.gz",
                ["aarch64-linux"] = "cmake-{version}-linux-aarch64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "cmake", "ctest", "cpack" },
        checks = {
            { "cmake", "--version" },
            { "cmake", "-E", "capabilities" },
            { "cmake", "--system-information" },
            { "ctest", "--version" },
            { "cpack", "--version" },
        },
    },
    versions = {
        ["4.4.3"] = {
            revision = 1,
        },
    },
}
