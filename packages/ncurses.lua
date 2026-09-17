return {
    schema = 2,
    name = "ncurses",
    description = "Terminal handling and terminfo library",
    default_version = "6.6",
    homepage = "https://invisible-island.net/ncurses/",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    build = {
        backend = "custom",
        steps = {
            configure = {
                {
                    "sh",
                    "./configure",
                    "--prefix=/",
                    "--without-shared",
                    "--with-normal",
                    "--without-debug",
                    "--without-ada",
                    "--without-cxx",
                    "--disable-widec",
                    "--without-manpages",
                    "--enable-pc-files",
                    "--with-pkg-config-libdir=/lib/pkgconfig",
                    "--with-terminfo-dirs=/etc/terminfo:/lib/terminfo:/usr/share/terminfo",
                },
            },
            build = { { "make", "-j{jobs}" } },
            check = {
                { "make", "-C", "include", "check" },
                { "make", "-C", "test", "check" },
                { "progs/tic", "-x", "-o", "test-terminfo", "misc/terminfo.src" },
                { "progs/infocmp", "-A", "test-terminfo", "xterm-256color" },
            },
            install = { { "make", "DESTDIR={prefix}", "install" } },
        },
    },
    inputs = {
        source = {
            url = "https://ftp.gnu.org/gnu/ncurses/ncurses-{version}.tar.gz",
            archive = "tar.gz",
            strip_prefix = "ncurses-{version}",
        },
    },
    outputs = {
        libraries = { "lib/libncurses.a", "lib/libform.a", "lib/libmenu.a", "lib/libpanel.a" },
        bins = { "tic", "infocmp", "tput" },
        checks = { { "tic", "-V" }, { "infocmp", "-V" }, { "tput", "-V" } },
    },
    versions = {
        ["6.6"] = {
            inputs = {
                source = {
                    sha256 = "355b4cbbed880b0381a04c46617b7656e362585d52e9cf84a67e2009b749ff11",
                },
            },
        },
    },
}
