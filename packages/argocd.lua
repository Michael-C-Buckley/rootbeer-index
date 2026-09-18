return {
    schema = 2,
    name = "argocd",
    description = "Manage Argo CD applications and deployments",
    homepage = "https://argo-cd.readthedocs.io",
    default_version = "3.5.3",
    upstream = {
        github = "argoproj/argo-cd",
        repository_id = 120896210,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "argoproj/argo-cd",
            tag = "v{version}",
            assets = {
                ["aarch64-linux"] = "argocd-linux-arm64",
                ["aarch64-macos"] = "argocd-darwin-arm64",
                ["x86_64-linux"] = "argocd-linux-amd64",
            },
        },
    },
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    outputs = {
        bins = { "argocd" },
        checks = {
            { "argocd", "version", "--client", "--short" },
        },
    },
    versions = {
        ["3.5.2"] = {
            revision = 2,
        },
        ["3.5.3"] = {},
    },
}
