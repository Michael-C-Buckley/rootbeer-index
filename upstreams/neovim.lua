return {
    exclude_tags = { "stable" },
    ["name"] = "neovim",
    ["repository"] = "neovim/neovim",
    ["repository_id"] = 16408992,
    ["aliases"] = {
        "nvim",
    },
    ["description"] = "Edit text with Neovim",
    ["homepage"] = "https://github.com/neovim/neovim",
    ["systems"] = {
        "aarch64-linux",
        "aarch64-macos",
        "x86_64-linux",
        "x86_64-macos",
    },
    ["assets"] = {
        ["aarch64-linux"] = "nvim-linux-arm64.tar.gz",
        ["aarch64-macos"] = "nvim-macos-arm64.tar.gz",
        ["x86_64-linux"] = "nvim-linux-x86_64.tar.gz",
        ["x86_64-macos"] = "nvim-macos-x86_64.tar.gz",
    },
    ["bins"] = {
        "nvim",
    },
    ["checks"] = {
        {
            "nvim",
            "--version",
        },
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
}
