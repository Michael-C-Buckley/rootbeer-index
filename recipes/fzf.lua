return {
	name = "fzf",
	description = "Find and select text interactively",
	homepage = "https://github.com/junegunn/fzf",
	default_version = "0.74.4",
	versions = {
		["0.74.4"] = {
			revision = 1,
			source = "github:junegunn/fzf@v0.74.4",
			assets = {
				["aarch64-macos"] = "fzf-0.74.4-darwin_arm64.tar.gz",
				["x86_64-macos"] = "fzf-0.74.4-darwin_amd64.tar.gz",
				["aarch64-linux"] = "fzf-0.74.4-linux_arm64.tar.gz",
				["x86_64-linux"] = "fzf-0.74.4-linux_amd64.tar.gz",
			},
			systems = {
				"aarch64-macos",
				"x86_64-macos",
				"aarch64-linux",
				"x86_64-linux",
			},
			bins = { "fzf" },
			checks = {
				{ "fzf", "--version" },
				{ "fzf", "--bash" },
			},
		},
	},
}
