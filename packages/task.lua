return {
    name = "task",
    description = "Run commands from Taskfiles",
    default_version = "3.53.1",
    source = {
        github = "go-task/task",
        tag = "v{version}",
        repository_id = 83252983,
        assets = {
            ["aarch64-linux"] = "task_linux_arm64.tar.gz",
            ["aarch64-macos"] = "task_darwin_arm64.tar.gz",
            ["x86_64-linux"] = "task_linux_amd64.tar.gz",
            ["x86_64-macos"] = "task_darwin_amd64.tar.gz",
        },
    },
    bins = { "task" },
    checks = {
        { "task", "--version" },
        { "task", "--help" },
    },
    versions = {
        ["3.53.1"] = {},
    },
}
