return {
    schema = 2,
    name = "git",
    description = "Distributed version control system",
    default_version = "2.55.0",
    homepage = "https://git-scm.com/",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    build = {
        backend = "custom",
        dependencies = { "curl@8.22.0", "expat@2.8.4", "openssl@4.0.2", "zlib@1.3.2", "libiconv@1.19", "pkgconf@3.0.7" },
        steps = {
            configure = {
                {
                    "/bin/sh",
                    "-ec",
                    'printf \'%s\' "$1" > config.mak; printf "CURL_LDFLAGS = %s\\nCURL_CFLAGS = %s\\n" "$(pkg-config --static --libs libcurl)" "$(pkg-config --cflags libcurl)" >> config.mak',
                    "rootbeer-git",
                    "prefix = /\nRUNTIME_PREFIX = YesPlease\nNO_GETTEXT = YesPlease\nNO_RUST = YesPlease\nNO_TCLTK = YesPlease\nPERL_PATH = /usr/bin/perl\nPYTHON_PATH = /usr/bin/python3\nUSE_LIBPCRE =\n",
                },
            },
            build = { { "make", "-j{jobs}" } },
            check = {
                {
                    "make",
                    "-j{jobs}",
                    "test",
                    "NO_SVN_TESTS=YesPlease",
                    "T=t0000-basic.sh t0001-init.sh t1300-config.sh t1500-rev-parse.sh t5500-fetch-pack.sh t5601-clone.sh t5700-protocol-v1.sh",
                },
            },
            install = { { "make", "DESTDIR={prefix}", "install" } },
        },
    },
    inputs = {
        source = {
            url = "https://www.kernel.org/pub/software/scm/git/git-{version}.tar.xz",
            archive = "tar.xz",
            strip_prefix = "git-{version}",
        },
    },
    outputs = {
        bins = { "git", "git-receive-pack", "git-upload-pack", "git-upload-archive" },
        checks = {
            { "git", "--version" },
            {
                "git",
                "-c",
                'alias.rootbeer-check=!set -eu; directory=$(mktemp -d); trap \'rm -rf "$directory"\' EXIT; git init -q "$directory/repository"; git -C "$directory/repository" -c user.name=Rootbeer -c user.email=rootbeer@example.invalid commit -qm initial --allow-empty; git clone -q "$directory/repository" "$directory/clone"; git -C "$directory/clone" fsck --strict; test -x "$(git --exec-path)/git-remote-https"',
                "rootbeer-check",
            },
        },
    },
    versions = {
        ["2.55.0"] = {
            inputs = {
                source = {
                    sha256 = "457fdb04dc8728e007d4688695e6912e6f680727920f2a40bf11eacc17505357",
                },
            },
        },
    },
}
