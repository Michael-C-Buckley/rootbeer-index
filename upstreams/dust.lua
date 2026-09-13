return {
    ["name"] = "dust",
    ["repository"] = "bootandy/dust",
    ["repository_id"] = 125563061,
    ["description"] = "Inspect directory disk usage",
    ["homepage"] = "https://github.com/bootandy/dust",
    ["exclude_tags"] = {
        "v0.8.1-alpha.2",
        "v0.8.1-alpha.1",
        "untagged-1499119fdec1dec70238",
    },
    ["systems"] = {
        "aarch64-linux",
        "aarch64-macos",
        "x86_64-linux",
        "x86_64-macos",
    },
    ["assets"] = {
        ["aarch64-linux"] = "dust-{tag}-aarch64-unknown-linux-musl.tar.gz",
        ["aarch64-macos"] = "dust-{tag}-aarch64-apple-darwin.tar.gz",
        ["x86_64-linux"] = "dust-{tag}-x86_64-unknown-linux-musl.tar.gz",
        ["x86_64-macos"] = "dust-{tag}-x86_64-apple-darwin.tar.gz",
    },
    ["bins"] = {
        "dust",
    },
    ["checks"] = {
        {
            "dust",
            "--version",
        },
    },
}
