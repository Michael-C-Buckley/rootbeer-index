return {
    schema = 2,
    name = "jq",
    description = "Query and transform JSON",
    default_version = "1.8.2",
    homepage = "https://github.com/jqlang/jq",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    upstream = {
        github = "jqlang/jq",
        repository_id = 5101141,
        tag_prefix = "jq-",
    },
    build = {
        backend = "autotools",
        configure = { "--disable-maintainer-mode", "--with-oniguruma=builtin", "--disable-shared" },
    },
    inputs = {
        source = {
            url = "https://github.com/jqlang/jq/releases/download/jq-{version}/jq-{version}.tar.gz",
            archive = "tar.gz",
            strip_prefix = "jq-{version}",
        },
        prebuilt = {
            github = "jqlang/jq",
            tag = "jq-{version}",
            assets = {
                ["x86_64-linux"] = "jq-linux-amd64",
                ["aarch64-macos"] = "jq-macos-arm64",
                ["aarch64-linux"] = "jq-linux-arm64",
            },
        },
    },
    outputs = {
        bins = { "jq" },
        checks = {
            { "jq", "--version" },
            { "jq", "--null-input", "--exit-status", "[1,2,3] | add == 6" },
        },
    },
    versions = {
        ["1.8.2"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "71b8d6e8f5fe81f6c6d0d110e3892251f6ce76ed095abd315e26e6e1193af3af",
                },
            },
        },
    },
}
