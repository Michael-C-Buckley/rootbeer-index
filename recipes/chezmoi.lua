return {
	name = "chezmoi",
	description = "Manage dotfiles across machines",
	homepage = "https://github.com/twpayne/chezmoi",
	default_version = "2.72.1",
	versions = {
		["2.72.1"] = {
			revision = 1,
			source = "github:twpayne/chezmoi@v2.72.1",
			assets = {
				["aarch64-macos"] = "chezmoi_2.72.1_darwin_arm64.tar.gz",
				["x86_64-macos"] = "chezmoi_2.72.1_darwin_amd64.tar.gz",
				["aarch64-linux"] = "chezmoi_2.72.1_linux_arm64.tar.gz",
				["x86_64-linux"] = "chezmoi_2.72.1_linux_amd64.tar.gz",
			},
			systems = {
				"aarch64-macos",
				"x86_64-macos",
				"aarch64-linux",
				"x86_64-linux",
			},
			bins = { "chezmoi" },
			checks = {
				{ "chezmoi", "--version" },
			},
		},
	},
}
