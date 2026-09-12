return {
	name = "gh",
	description = "Work with GitHub from the command line",
	homepage = "https://github.com/cli/cli",
	default_version = "2.100.0",
	versions = {
		["2.100.0"] = {
			revision = 1,
			source = "github:cli/cli@v2.100.0",
			assets = {
				["aarch64-macos"] = "gh_2.100.0_macOS_arm64.zip",
				["x86_64-macos"] = "gh_2.100.0_macOS_amd64.zip",
				["aarch64-linux"] = "gh_2.100.0_linux_arm64.tar.gz",
				["x86_64-linux"] = "gh_2.100.0_linux_amd64.tar.gz",
			},
			systems = {
				"aarch64-macos",
				"x86_64-macos",
				"aarch64-linux",
				"x86_64-linux",
			},
			bins = { "gh" },
			checks = {
				{ "gh", "--version" },
			},
		},
	},
}
