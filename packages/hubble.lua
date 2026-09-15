return {
    schema = 2,
    name = "hubble",
    description = "Inspect Kubernetes network traffic with Cilium",
    default_version = "1.19.4",
    homepage = "https://github.com/cilium/hubble",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "cilium/hubble",
        repository_id = 222612062,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "cilium/hubble",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "hubble-linux-amd64.tar.gz",
                ["aarch64-macos"] = "hubble-darwin-arm64.tar.gz",
                ["aarch64-linux"] = "hubble-linux-arm64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "hubble" },
        checks = { { "hubble", "version" }, { "hubble", "observe", "--help" } },
    },
    versions = {
        ["1.19.4"] = {
            revision = 2,
        },
    },
}
