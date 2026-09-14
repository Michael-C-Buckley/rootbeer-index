return {
    name = "argocd",
    description = "Manage Argo CD applications and deployments",
    homepage = "https://argo-cd.readthedocs.io",
    default_version = "3.5.2",
    source = {
        github = "argoproj/argo-cd",
        tag = "v{version}",
        repository_id = 120896210,
        assets = {
            ["aarch64-linux"] = "argocd-linux-arm64",
            ["aarch64-macos"] = "argocd-darwin-arm64",
            ["x86_64-linux"] = "argocd-linux-amd64",
            ["x86_64-macos"] = "argocd-darwin-amd64",
        },
    },
    bins = { "argocd" },
    checks = {
        { "argocd", "version", "--client", "--short" },
    },
    versions = {
        ["3.5.2"] = {},
    },
}
