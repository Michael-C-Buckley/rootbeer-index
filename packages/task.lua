return {
    schema = 2,
    name = "task",
    description = "Run commands from Taskfiles",
    default_version = "3.53.1",
    homepage = "https://github.com/go-task/task",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "go-task/task",
        repository_id = 83252983,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "go-task/task",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "task_linux_amd64.tar.gz",
                ["aarch64-macos"] = "task_darwin_arm64.tar.gz",
                ["aarch64-linux"] = "task_linux_arm64.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "task" },
        checks = { { "task", "--version" }, { "task", "--help" } },
    },
    versions = {
        ["3.53.1"] = {
            revision = 2,
        },
    },
}
