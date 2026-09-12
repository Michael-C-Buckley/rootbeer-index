return {
	name = "lsd",
	description = "List directory contents",
	homepage = "https://github.com/lsd-rs/lsd",
	default_version = "1.2.0",
	versions = {
		["1.2.0"] = {
			revision = 1,
			source = "github:lsd-rs/lsd@v1.2.0",
			assets = {
				["aarch64-macos"] = "lsd-v1.2.0-aarch64-apple-darwin.tar.gz",
				["x86_64-macos"] = "lsd-v1.2.0-x86_64-apple-darwin.tar.gz",
				["aarch64-linux"] = "lsd-v1.2.0-aarch64-unknown-linux-musl.tar.gz",
				["x86_64-linux"] = "lsd-v1.2.0-x86_64-unknown-linux-musl.tar.gz",
			},
			systems = {
				"aarch64-macos",
				"x86_64-macos",
				"aarch64-linux",
				"x86_64-linux",
			},
			bins = { "lsd" },
			checks = {
				{ "lsd", "--version" },
			},
		},
	},
}
