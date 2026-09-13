return {
	upstream = {
		provider = "github",
		repository = "FiloSottile/mkcert",
		repository_id = 138547797,
		assets = {
			["aarch64-linux"] = "mkcert-{tag}-linux-arm64",
			["aarch64-macos"] = "mkcert-{tag}-darwin-arm64",
			["x86_64-linux"] = "mkcert-{tag}-linux-amd64",
			["x86_64-macos"] = "mkcert-{tag}-darwin-amd64",
		},
	},
	name = "mkcert",
	description = "Create locally trusted development certificates",
	homepage = "https://github.com/FiloSottile/mkcert",
	default_version = "1.4.4",
	versions = {
		["1.4.4"] = {
			revision = 1,
			source = "github:FiloSottile/mkcert@v1.4.4",
			assets = {
				["aarch64-macos"] = "mkcert-v1.4.4-darwin-arm64",
				["x86_64-macos"] = "mkcert-v1.4.4-darwin-amd64",
				["aarch64-linux"] = "mkcert-v1.4.4-linux-arm64",
				["x86_64-linux"] = "mkcert-v1.4.4-linux-amd64",
			},
			systems = {
				"aarch64-macos",
				"x86_64-macos",
				"aarch64-linux",
				"x86_64-linux",
			},
			bins = { "mkcert" },
			checks = {
				{ "mkcert", "--version" },
			},
		},
	},
}
