return {
    name = "flux",
    description = "Manage GitOps deployments with Flux",
    default_version = "2.9.5",
    source = {
        github = "fluxcd/flux2",
        tag = "v{version}",
        repository_id = 258469100,
        assets = {
            ["aarch64-linux"] = "flux_{version}_linux_arm64.tar.gz",
            ["aarch64-macos"] = "flux_{version}_darwin_arm64.tar.gz",
            ["x86_64-linux"] = "flux_{version}_linux_amd64.tar.gz",
            ["x86_64-macos"] = "flux_{version}_darwin_amd64.tar.gz",
        },
    },
    bins = { "flux" },
    checks = {
        { "flux", "version", "--client" },
    },
    versions = {
        ["2.9.5"] = {},
    },
}
