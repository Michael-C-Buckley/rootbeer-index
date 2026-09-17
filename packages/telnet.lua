return {
    schema = 2,
    name = "telnet",
    description = "Connect to remote hosts using the Telnet protocol",
    default_version = "2.8",
    homepage = "https://www.gnu.org/software/inetutils/",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    build = {
        backend = "autotools",
        configure = {
            "--disable-servers",
            "--disable-clients",
            "--enable-telnet",
            "--disable-nls",
            "--disable-rpath",
            "--without-idn",
            "--without-libreadline-prefix",
            "--with-ncurses-include-dir={dependencies}/include",
        },
        dependencies = { "ncurses@6.6" },
    },
    inputs = {
        source = {
            url = "https://ftp.gnu.org/gnu/inetutils/inetutils-{version}.tar.gz",
            archive = "tar.gz",
            strip_prefix = "inetutils-{version}",
        },
    },
    outputs = {
        bins = { "telnet" },
        checks = { { "telnet", "--version" }, { "telnet", "--help" } },
    },
    versions = {
        ["2.8"] = {
            inputs = {
                source = {
                    sha256 = "57b3cf4f77555992881e5ba2a09a63b05aa2c56342a60ed4305b5f45938390b5",
                },
            },
        },
    },
}
