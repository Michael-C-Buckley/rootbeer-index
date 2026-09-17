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
            check = {
                { "make", "-C", "lib", "check" },
                { "/bin/sh", "-ec", "cd tests; make check TESTS=\"unit-tests $(printf '%s ' Test-ftp*.px)\"" },
                {
                    "python3",
                    "-c",
                    [[
import http.server
import pathlib
import ssl
import subprocess
import tempfile
import threading

wget = str(pathlib.Path('src/wget').resolve())
payload = b'rootbeer-wget\n' * 4096

class Handler(http.server.BaseHTTPRequestHandler):
    def log_message(self, *args):
        pass

    def do_GET(self):
        if self.path == '/redirect':
            self.send_response(302)
            self.send_header('Location', '/payload')
            self.end_headers()
            return
        if self.path != '/payload':
            self.send_error(404)
            return
        start = int(self.headers.get('Range', 'bytes=0-')[6:].split('-')[0])
        self.send_response(206 if start else 200)
        self.send_header('Content-Length', str(len(payload) - start))
        if start:
            self.send_header('Content-Range', f'bytes {start}-{len(payload)-1}/{len(payload)}')
        self.end_headers()
        self.wfile.write(payload[start:])

with tempfile.TemporaryDirectory() as directory:
    root = pathlib.Path(directory)
    def run(*args, success=True):
        result = subprocess.run([wget, '--no-config', '--no-hsts', '--tries=1', '--timeout=5', '-q', *args], cwd=root, capture_output=True, timeout=15)
        assert (result.returncode == 0) == success, (args, result.returncode, result.stderr)
        return result.stdout

    server = http.server.ThreadingHTTPServer(('127.0.0.1', 0), Handler)
    thread = threading.Thread(target=server.serve_forever, daemon=True)
    thread.start()
    url = f'http://127.0.0.1:{server.server_port}'
    try:
        assert run('-O-', url + '/redirect') == payload
        run('-O-', url + '/missing', success=False)
        (root / 'download').write_bytes(payload[:123])
        run('-c', '-O', 'download', url + '/payload')
        assert (root / 'download').read_bytes() == payload
    finally:
        server.shutdown()
        server.server_close()

    certificate = root / 'certificate.pem'
    key = root / 'key.pem'
    subprocess.run(['openssl', 'req', '-x509', '-newkey', 'rsa:2048', '-nodes', '-days', '1', '-subj', '/CN=localhost', '-addext', 'subjectAltName=DNS:localhost', '-keyout', str(key), '-out', str(certificate)], check=True, capture_output=True)
    server = http.server.ThreadingHTTPServer(('127.0.0.1', 0), Handler)
    context = ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)
    context.load_cert_chain(certificate, key)
    server.socket = context.wrap_socket(server.socket, server_side=True)
    threading.Thread(target=server.serve_forever, daemon=True).start()
    url = f'https://localhost:{server.server_port}/payload'
    try:
        assert run('--ca-certificate=' + str(certificate), '-O-', url) == payload
        run('-O-', url, success=False)
    finally:
        server.shutdown()
        server.server_close()
print('HTTP redirects, resume, errors, and HTTPS certificate validation passed')
]],
                },
            },
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
            },
        },
    },
    outputs = {
        bins = { "wget" },
        checks = { { "wget", "--version" }, { "wget", "--help" } },
    },
    versions = {
        ["1.25.0"] = {
            revision = 2,
            inputs = {
                source = {
                    sha256 = "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb726ac9d0da3784",
                },
            },
        },
    },
}
