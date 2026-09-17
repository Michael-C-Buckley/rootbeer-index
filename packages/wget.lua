return {
    schema = 2,
    name = "wget",
    description = "Retrieve files over HTTP, HTTPS, and FTP",
    default_version = "1.25.0",
    homepage = "https://www.gnu.org/software/wget/",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    build = {
        backend = "custom",
        dependencies = {
            "openssl@4.0.2",
            "libpsl@0.23.3",
            "libidn2@2.3.8",
            "libiconv@1.19",
            "libunistring@1.4.2",
            "zlib@1.3.2",
            "pkgconf@3.0.7",
        },
        steps = {
            configure = {
                {
                    "/bin/sh",
                    "-ec",
                    'LIBPSL_LIBS="$(pkg-config --static --libs libpsl)" LIBIDN2_LIBS="$(pkg-config --static --libs libidn2)" ./configure --prefix=/ --with-ssl=openssl --disable-nls --disable-rpath --disable-pcre --disable-pcre2 --without-libiconv-prefix --without-libunistring-prefix',
                },
            },
            build = { { "make", "-j{jobs}" } },
            check = { { "make", "check" } },
            install = { { "make", "DESTDIR={prefix}", "install" } },
        },
    },
    inputs = {
        source = {
            url = "https://ftp.gnu.org/gnu/wget/wget-{version}.tar.gz",
            archive = "tar.gz",
            strip_prefix = "wget-{version}",
            patches = {
                "--- a/src/openssl.c\n+++ b/src/openssl.c\n@@ -226,7 +226,7 @@\n       break;\n \n     case secure_protocol_sslv3:\n-#ifndef OPENSSL_NO_SSL3_METHOD\n+#if !defined(OPENSSL_NO_SSL3_METHOD) && OPENSSL_VERSION_NUMBER < 0x40000000L\n       meth = SSLv3_client_method ();\n #endif\n       break;\n",
                '--- a/tests/Test-ftp-iri.px\n+++ b/tests/Test-ftp-iri.px\n@@ -2,6 +2,15 @@\n \n use strict;\n use warnings;\n+\n+# APFS cannot represent the byte-oriented filenames used by this test.\n+my $probe_name = "wget-filename-$$-\\xE7";\n+open my $probe, \'>\', $probe_name or do {\n+    exit 77 if $!{EILSEQ};\n+    die "Cannot probe filename support: $!";\n+};\n+close $probe;\n+unlink $probe_name;\n \n use WgetFeature qw(iri);\n use FTPTest;\n',
                '--- a/tests/Test-ftp-iri-fallback.px\n+++ b/tests/Test-ftp-iri-fallback.px\n@@ -2,6 +2,15 @@\n \n use strict;\n use warnings;\n+\n+# APFS cannot represent the byte-oriented filenames used by this test.\n+my $probe_name = "wget-filename-$$-\\xE7";\n+open my $probe, \'>\', $probe_name or do {\n+    exit 77 if $!{EILSEQ};\n+    die "Cannot probe filename support: $!";\n+};\n+close $probe;\n+unlink $probe_name;\n \n use WgetFeature qw(iri);\n use FTPTest;\n',
                '--- a/tests/Test-ftp-iri-recursive.px\n+++ b/tests/Test-ftp-iri-recursive.px\n@@ -2,6 +2,15 @@\n \n use strict;\n use warnings;\n+\n+# APFS cannot represent the byte-oriented filenames used by this test.\n+my $probe_name = "wget-filename-$$-\\xE7";\n+open my $probe, \'>\', $probe_name or do {\n+    exit 77 if $!{EILSEQ};\n+    die "Cannot probe filename support: $!";\n+};\n+close $probe;\n+unlink $probe_name;\n \n use WgetFeature qw(iri);\n use FTPTest;\n',
                '--- a/tests/Test-ftp-iri-disabled.px\n+++ b/tests/Test-ftp-iri-disabled.px\n@@ -2,6 +2,15 @@\n \n use strict;\n use warnings;\n+\n+# APFS cannot represent the byte-oriented filenames used by this test.\n+my $probe_name = "wget-filename-$$-\\xE7";\n+open my $probe, \'>\', $probe_name or do {\n+    exit 77 if $!{EILSEQ};\n+    die "Cannot probe filename support: $!";\n+};\n+close $probe;\n+unlink $probe_name;\n \n use WgetFeature qw(iri);\n use FTPTest;\n',
                '--- a/tests/Test-iri-disabled.px\n+++ b/tests/Test-iri-disabled.px\n@@ -2,6 +2,15 @@\n \n use strict;\n use warnings;\n+\n+# APFS cannot represent the byte-oriented filenames used by this test.\n+my $probe_name = "wget-filename-$$-\\xE7";\n+open my $probe, \'>\', $probe_name or do {\n+    exit 77 if $!{EILSEQ};\n+    die "Cannot probe filename support: $!";\n+};\n+close $probe;\n+unlink $probe_name;\n \n use HTTPTest;\n \n',
                '--- a/tests/Test-iri-list.px\n+++ b/tests/Test-iri-list.px\n@@ -2,6 +2,15 @@\n \n use strict;\n use warnings;\n+\n+# APFS cannot represent the byte-oriented filenames used by this test.\n+my $probe_name = "wget-filename-$$-\\xE7";\n+open my $probe, \'>\', $probe_name or do {\n+    exit 77 if $!{EILSEQ};\n+    die "Cannot probe filename support: $!";\n+};\n+close $probe;\n+unlink $probe_name;\n \n use WgetFeature qw(iri);\n use HTTPTest;\n',
            },
        },
    },
    outputs = {
        bins = { "wget" },
        checks = { { "wget", "--version" }, { "wget", "--help" } },
    },
    versions = {
        ["1.25.0"] = {
            inputs = {
                source = {
                    sha256 = "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb726ac9d0da3784",
                },
            },
        },
    },
}
