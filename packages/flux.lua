return {
    schema = 2,
    name = "flux",
    description = "Manage GitOps deployments with Flux",
    default_version = "2.9.5",
    homepage = "https://github.com/fluxcd/flux2",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "fluxcd/flux2",
        repository_id = 258469100,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "fluxcd/flux2",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "flux_{version}_linux_amd64.tar.gz",
                ["aarch64-macos"] = "flux_{version}_darwin_arm64.tar.gz",
                ["aarch64-linux"] = "flux_{version}_linux_arm64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "flux" },
        checks = { { "flux", "version", "--client" } },
    },
    versions = {
        ["2.9.5"] = {
            revision = 2,
        },
    },
}
