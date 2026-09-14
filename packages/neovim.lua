return {
    name = "neovim",
    aliases = { "nvim" },
    description = "Edit text with Neovim",
    default_version = "0.12.5",
    source = {
        github = "neovim/neovim",
        tag = "v{version}",
        repository_id = 16408992,
        exclude_tags = { "stable" },
        assets = {
            ["aarch64-linux"] = "nvim-linux-arm64.tar.gz",
            ["aarch64-macos"] = "nvim-macos-arm64.tar.gz",
            ["x86_64-linux"] = "nvim-linux-x86_64.tar.gz",
        },
    },
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    bins = { "nvim" },
    checks = {
        { "nvim", "--version" },
        {
            "nvim",
            "--headless",
            "-u",
            "NONE",
            "-i",
            "NONE",
            "-n",
            "-c",
            "lua assert(vim.fn.filereadable(vim.env.VIMRUNTIME .. '/syntax/syntax.vim') == 1)",
            "-c",
            "qa!",
        },
    },
    versions = {
        ["0.12.5"] = { revision = 2 },
    },
}
