return {
	name = "mise",
	description = "Manage development tools and tasks",
	homepage = "https://github.com/jdx/mise",
	default_version = "2026.9.5",
	versions = {
		["2026.9.5"] = {
			revision = 1,
			source = "github:jdx/mise@v2026.9.5",
			assets = {
				["aarch64-macos"] = "mise-v2026.9.5-macos-arm64.tar.gz",
				["x86_64-macos"] = "mise-v2026.9.5-macos-x64.tar.gz",
				["aarch64-linux"] = "mise-v2026.9.5-linux-arm64-musl.tar.gz",
				["x86_64-linux"] = "mise-v2026.9.5-linux-x64-musl.tar.gz",
			},
			systems = {
				"aarch64-macos",
				"x86_64-macos",
				"aarch64-linux",
				"x86_64-linux",
			},
			bins = { "mise" },
			checks = {
				{ "mise", "--version" },
			},
		},
	},
}
