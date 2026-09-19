return {
    schema = 2,
    name = "uv",
    description = "Manage Python projects, tools, and environments",
    homepage = "https://github.com/astral-sh/uv",
    default_version = "0.12.17",
    upstream = {
        github = "astral-sh/uv",
        repository_id = 699532645,
        tag_prefix = "",
    },
    inputs = {
        prebuilt = {
            github = "astral-sh/uv",
            tag = "{version}",
            assets = {
                ["aarch64-linux"] = "uv-aarch64-unknown-linux-musl.tar.gz",
                ["aarch64-macos"] = "uv-aarch64-apple-darwin.tar.gz",
                ["x86_64-linux"] = "uv-x86_64-unknown-linux-musl.tar.gz",
            },
        },
    },
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    outputs = {
        bins = { "uv", "uvx" },
        checks = {
            { "uv", "--version" },
            { "uvx", "--version" },
            { "uv", "python", "list", "--only-installed", "--offline" },
        },
    },
    versions = {
        ["0.12.13"] = {
            revision = 2,
        },
        ["0.12.16"] = {},
        ["0.12.17"] = {},
    },
}
