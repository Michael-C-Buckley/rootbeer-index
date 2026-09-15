return {
    schema = 2,
    name = "neovim",
    aliases = { "nvim" },
    description = "Edit text with Neovim",
    default_version = "0.12.5",
    homepage = "https://github.com/neovim/neovim",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    upstream = {
        github = "neovim/neovim",
        repository_id = 16408992,
        tag_prefix = "v",
        exclude_tags = { "stable" },
    },
    inputs = {
        prebuilt = {
            github = "neovim/neovim",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "nvim-linux-x86_64.tar.gz",
                ["aarch64-macos"] = "nvim-macos-arm64.tar.gz",
                ["aarch64-linux"] = "nvim-linux-arm64.tar.gz",
            },
        },
    },
    outputs = {
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
    },
    versions = {
        ["0.12.5"] = {
            revision = 2,
        },
    },
}
