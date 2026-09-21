return {
    schema = 2,
    name = "openssh",
    description = "Connect to and serve secure shell sessions",
    homepage = "https://www.openssh.com/portable.html",
    default_version = "10.5p1",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    build = {
        backend = "custom",
        dependencies = { "libxcrypt@4.5.2", "openssl@4.0.2", "zlib@1.3.2" },
        steps = {
            configure = {
                {
                    "/bin/sh",
                    "./configure",
                    "--prefix=/",
                    "--sysconfdir=/etc/ssh",
                    "--with-ssl-dir={dependencies}",
                    "--with-zlib={dependencies}",
                    "--without-pam",
                    "--without-kerberos5",
                    "--without-security-key-builtin",
                    "--disable-strip",
                },
            },
            build = { { "make", "-j{jobs}" } },
            check = { { "make", "-j{jobs}", "unit" } },
            install = {
                { "make", "DESTDIR={prefix}", "install-nokeys" },
                { "ln", "-s", "../sbin/sshd", "{prefix}/bin/sshd" },
            },
        },
    },
    inputs = {
        source = {
            url = "https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-{version}.tar.gz",
            archive = "tar.gz",
            strip_prefix = "openssh-{version}",
            patches = {
                '--- a/sandbox-darwin.c\n+++ b/sandbox-darwin.c\n@@ -21,6 +21,9 @@\n \n #include <sandbox.h>\n \n+/* macOS SDK 27 exports this symbol but no longer declares it. */\n+extern const char kSBXProfilePureComputation[];\n+\n #include <errno.h>\n #include <stdarg.h>\n #include <stdio.h>\n',
            },
        },
    },
    outputs = {
        bins = {
            "scp",
            "sftp",
            "ssh",
            "ssh-add",
            "ssh-agent",
            "ssh-keygen",
            "ssh-keyscan",
            "sshd",
        },
        checks = {
            { "ssh", "-V" },
            { "ssh", "-Q", "key" },
        },
    },
    versions = {
        ["10.5p1"] = {
            inputs = {
                source = {
                    sha256 = "d44d28a839ea9daf969cc69150fde59910b2b39361dad81a3bd6cbd19218db11",
                },
            },
        },
    },
}
