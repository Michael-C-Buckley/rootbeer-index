return {
    schema = 2,
    name = "libxcrypt",
    description = "Hash passwords with modern crypt implementations",
    homepage = "https://github.com/besser82/libxcrypt",
    default_version = "4.5.2",
    upstream = {
        github = "besser82/libxcrypt",
        repository_id = 35503965,
        tag_prefix = "v",
    },
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    build = {
        backend = "autotools",
        configure = {
            "--disable-shared",
            "--enable-static",
            "--enable-obsolete-api=yes",
        },
    },
    inputs = {
        source = {
            url = "https://github.com/besser82/libxcrypt/releases/download/v{version}/libxcrypt-{version}.tar.xz",
            archive = "tar.xz",
            strip_prefix = "libxcrypt-{version}",
            patches = {
                [[
--- a/lib/crypt-gost-yescrypt.c
+++ b/lib/crypt-gost-yescrypt.c
@@ -134 +134 @@
-  char *hptr = strchr ((const char *) intbuf->retval + 3, '$');
+  char *hptr = strchr ((char *) intbuf->retval + 3, '$');
--- a/lib/crypt-sm3-yescrypt.c
+++ b/lib/crypt-sm3-yescrypt.c
@@ -139 +139 @@
-  char *hptr = strchr ((const char *) intbuf->retval + 3, '$');
+  char *hptr = strchr ((char *) intbuf->retval + 3, '$');
]],
            },
        },
    },
    outputs = {
        libraries = { "lib/libcrypt.a" },
        bins = {},
        checks = {},
    },
    versions = {
        ["4.5.2"] = {
            inputs = {
                source = {
                    sha256 = "71513a31c01a428bccd5367a32fd95f115d6dac50fb5b60c779d5c7942aec071",
                },
            },
        },
    },
}
