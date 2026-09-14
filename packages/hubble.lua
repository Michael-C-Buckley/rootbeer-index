return {
    name = "hubble",
    description = "Inspect Kubernetes network traffic with Cilium",
    default_version = "1.19.4",
    source = {
        github = "cilium/hubble",
        tag = "v{version}",
        repository_id = 222612062,
        assets = {
            ["aarch64-linux"] = "hubble-linux-arm64.tar.gz",
            ["aarch64-macos"] = "hubble-darwin-arm64.tar.gz",
            ["x86_64-linux"] = "hubble-linux-amd64.tar.gz",
            ["x86_64-macos"] = "hubble-darwin-amd64.tar.gz",
        },
    },
    bins = { "hubble" },
    checks = {
        { "hubble", "version" },
        { "hubble", "observe", "--help" },
    },
    versions = {
        ["1.19.4"] = {},
    },
}
