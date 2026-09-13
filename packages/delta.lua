return {
	upstream = {
		provider = "github",
		repository = "dandavison/delta",
		repository_id = 193526915,
		assets = {
			["aarch64-linux"] = "delta-{tag}-aarch64-unknown-linux-gnu.tar.gz",
			["aarch64-macos"] = "delta-{tag}-aarch64-apple-darwin.tar.gz",
			["x86_64-linux"] = "delta-{tag}-x86_64-unknown-linux-musl.tar.gz",
			["x86_64-macos"] = "delta-{tag}-x86_64-apple-darwin.tar.gz",
		},
	},
	name = "delta",
	description = "Display readable diffs",
	homepage = "https://github.com/dandavison/delta",
	default_version = "0.19.2",
	default_versions = { ["x86_64-macos"] = "0.18.2" },
	versions = {
		["0.19.2"] = {
			revision = 1,
			source = "github:dandavison/delta@0.19.2",
			assets = {
				["aarch64-macos"] = "delta-0.19.2-aarch64-apple-darwin.tar.gz",
				["aarch64-linux"] = "delta-0.19.2-aarch64-unknown-linux-gnu.tar.gz",
				["x86_64-linux"] = "delta-0.19.2-x86_64-unknown-linux-musl.tar.gz",
			},
			systems = {
				"aarch64-macos",
				"aarch64-linux",
				"x86_64-linux",
			},
			bins = { "delta" },
			checks = {
				{ "delta", "--version" },
			},
		},
		["0.18.2"] = {
			revision = 1,
			source = "github:dandavison/delta@0.18.2",
			assets = {
				["aarch64-macos"] = "delta-0.18.2-aarch64-apple-darwin.tar.gz",
				["x86_64-macos"] = "delta-0.18.2-x86_64-apple-darwin.tar.gz",
				["aarch64-linux"] = "delta-0.18.2-aarch64-unknown-linux-gnu.tar.gz",
				["x86_64-linux"] = "delta-0.18.2-x86_64-unknown-linux-musl.tar.gz",
			},
			systems = {
				"aarch64-macos",
				"x86_64-macos",
				"aarch64-linux",
				"x86_64-linux",
			},
			bins = { "delta" },
			checks = {
				{ "delta", "--version" },
			},
		},
	},
}
