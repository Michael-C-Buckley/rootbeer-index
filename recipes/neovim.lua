return {
	name = "neovim",
	aliases = { "nvim" },
	description = "Edit text with Neovim",
	homepage = "https://github.com/neovim/neovim",
	default_version = "0.12.5",
	versions = {
		["0.12.5"] = {
			revision = 1,
			source = "github:neovim/neovim@v0.12.5",
			assets = {
				["aarch64-macos"] = "nvim-macos-arm64.tar.gz",
				["x86_64-macos"] = "nvim-macos-x86_64.tar.gz",
				["aarch64-linux"] = "nvim-linux-arm64.tar.gz",
				["x86_64-linux"] = "nvim-linux-x86_64.tar.gz",
			},
			systems = {
				"aarch64-macos",
				"x86_64-macos",
				"aarch64-linux",
				"x86_64-linux",
			},
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
	},
}
