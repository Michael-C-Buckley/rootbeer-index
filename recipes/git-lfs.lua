return {
	name = "git-lfs",
	description = "Store large files in Git repositories",
	homepage = "https://github.com/git-lfs/git-lfs",
	default_version = "3.8.0",
	versions = {
		["3.8.0"] = {
			revision = 1,
			source = "github:git-lfs/git-lfs@v3.8.0",
			assets = {
				["aarch64-macos"] = "git-lfs-darwin-arm64-v3.8.0.zip",
				["x86_64-macos"] = "git-lfs-darwin-amd64-v3.8.0.zip",
				["aarch64-linux"] = "git-lfs-linux-arm64-v3.8.0.tar.gz",
				["x86_64-linux"] = "git-lfs-linux-amd64-v3.8.0.tar.gz",
			},
			systems = {
				"aarch64-macos",
				"x86_64-macos",
				"aarch64-linux",
				"x86_64-linux",
			},
			bins = { "git-lfs" },
			checks = {
				{ "git-lfs", "version" },
			},
		},
	},
}
