return {
	upstream = {
		provider = "github",
		repository = "str4d/rage",
		repository_id = 213749542,
		assets = {
			["aarch64-linux"] = "rage-{tag}-arm64-linux.tar.gz",
			["aarch64-macos"] = "rage-{tag}-arm64-darwin.tar.gz",
			["x86_64-linux"] = "rage-{tag}-x86_64-linux.tar.gz",
			["x86_64-macos"] = "rage-{tag}-x86_64-darwin.tar.gz",
		},
	},
	name = "rage",
	description = "Encrypt files using the age format",
	homepage = "https://github.com/str4d/rage",
	default_version = "0.12.1",
	versions = {
		["0.12.1"] = {
			revision = 1,
			source = "github:str4d/rage@v0.12.1",
			assets = {
				["aarch64-macos"] = "rage-v0.12.1-arm64-darwin.tar.gz",
				["x86_64-macos"] = "rage-v0.12.1-x86_64-darwin.tar.gz",
				["aarch64-linux"] = "rage-v0.12.1-arm64-linux.tar.gz",
				["x86_64-linux"] = "rage-v0.12.1-x86_64-linux.tar.gz",
			},
			systems = {
				"aarch64-macos",
				"x86_64-macos",
				"aarch64-linux",
				"x86_64-linux",
			},
			bins = { "rage", "rage-keygen" },
			checks = {
				{ "rage", "--version" },
				{ "rage-keygen", "--version" },
			},
		},
	},
}
