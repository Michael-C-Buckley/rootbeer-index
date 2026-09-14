return {
    name = "make",
    description = "Build targets with GNU Make",
    homepage = "https://www.gnu.org/software/make/",
    default_version = "4.4.1",
    build = {
        backend = "autotools",
        url = "https://ftp.gnu.org/gnu/make/make-4.4.1.tar.gz",
        archive = "tar.gz",
        strip_prefix = "make-4.4.1",
        configure = { "--disable-nls", "--without-guile" },
        patches = {
            [=[--- a/tests/scripts/features/archives
+++ b/tests/scripts/features/archives
@@ -29,13 +29,24 @@
 
 # Fallback if configure did not find AR
 my $ar = get_config('AR') || 'ar';
+if ($osname eq 'darwin') {
+  # Keep the SDK lookup cache outside the test's temporary-file assertions.
+  local $ENV{TMPDIR} = $origENV{TMPDIR} || '/tmp';
+  $ar = `xcrun --find ar`;
+  $? == 0 or die "Cannot locate ar";
+  chomp $ar;
+}
 
 my $redir = '2>&1';
 $redir = '' if $osname eq 'VMS';
 
 # This is the value from src/default.c
 my $arflags = $osname eq 'aix' ? '-Xany -rv' : '-rv';
-my $arvar = "AR=\"$ar\"";
+if ($osname eq 'darwin') {
+  # Apple's ranlib drops the non-object members used by these tests.
+  $arflags .= 'S';
+}
+my $arvar = "AR=\"$ar\" ARFLAGS=\"$arflags\"";
 
 # Newer versions of binutils can be built with --enable-deterministic-archives
 # which forces all timestamps (among other things) to always be 0, defeating
@@ -255,6 +266,12 @@
 utouch(-20, 'a.c', 'b.c');
 
 my $cc = get_config('CC') || 'cc';
+if ($osname eq 'darwin' && ($cc eq 'cc' || $cc eq '/usr/bin/cc')) {
+  local $ENV{TMPDIR} = $origENV{TMPDIR} || '/tmp';
+  $cc = `xcrun --find cc`;
+  $? == 0 or die "Cannot locate cc";
+  chomp $cc;
+}
 my $vars = "CC=\"$cc\" $arvar";
 
 run_make_test(q!
]=],
        },
    },
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    bins = { "make" },
    checks = {
        { "make", "--version" },
        {
            "make",
            "--no-builtin-rules",
            "--file=/dev/null",
            "--eval=all:;@test '$(MAKE_VERSION)' = 4.4.1",
            "all",
        },
        {
            "make",
            "--no-builtin-rules",
            "--file=/dev/null",
            [=[--eval=all:; +@set -eu; unset MAKEFLAGS MFLAGS; directory=$$(mktemp -d); trap 'rm -rf "$$directory"' EXIT; cd "$$directory"; printf '%s\n' 'all: first second' 'first second &: input; @cp input first; cp input second' 'input:; @printf "%s\n" rootbeer-make-ok > input' > Makefile; "$(MAKE)" --no-print-directory -j2; "$(MAKE)" --no-print-directory -q; test "$$(cat first)" = rootbeer-make-ok; test "$$(cat second)" = rootbeer-make-ok; printf '%s\n' changed > input; "$(MAKE)" --no-print-directory -W input; test "$$(cat first)" = changed; test "$$(cat second)" = changed]=],
            "all",
        },
    },
    versions = {
        ["4.4.1"] = {
            revision = 1,
            sha256 = "dd16fb1d67bfab79a72f5e8390735c49e3e8e70b4945a15ab1f81ddb78658fb3",
        },
    },
}
