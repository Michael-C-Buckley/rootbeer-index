return {
	upstream = {
		provider = "github",
		repository = "jqlang/jq",
		repository_id = 5101141,
		tag_prefix = "jq-",
		assets = {
			["aarch64-linux"] = "jq-linux-arm64",
			["aarch64-macos"] = "jq-macos-arm64",
			["x86_64-linux"] = "jq-linux-amd64",
			["x86_64-macos"] = "jq-macos-amd64",
		},
	},
	name = "jq",
	description = "Query and transform JSON",
	homepage = "https://github.com/jqlang/jq",
	default_version = "1.8.2",
	versions = {
		["1.8.2"] = {
			revision = 1,
			source = "github:jqlang/jq@jq-1.8.2",
			assets = {
				["aarch64-macos"] = "jq-macos-arm64",
				["x86_64-macos"] = "jq-macos-amd64",
				["aarch64-linux"] = "jq-linux-arm64",
				["x86_64-linux"] = "jq-linux-amd64",
			},
			systems = {
				"aarch64-macos",
				"x86_64-macos",
				"aarch64-linux",
				"x86_64-linux",
			},
			bins = { "jq" },
			checks = {
				{ "jq", "--version" },
				{ "jq", "--null-input", "--exit-status", "[1,2,3] | add == 6" },
			},
		},
	},
}
