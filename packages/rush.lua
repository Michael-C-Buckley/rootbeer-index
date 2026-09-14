return {
    name = "rush",
    description = "Run a POSIX shell with interactive editing and completions",
    homepage = "https://rush.horse",
    default_version = "0.1.0-dev.20260909+g294212ebd35f5b755062186a66bcfd6436d3627a",
    build = {
        backend = "zig",
        url = "https://codeload.github.com/rockorager/rush/tar.gz/294212ebd35f5b755062186a66bcfd6436d3627a",
        archive = "tar.gz",
        strip_prefix = "rush-294212ebd35f5b755062186a66bcfd6436d3627a",
        args = {
            "-Doptimize=ReleaseSafe",
            "-Dregister-shell=false",
            "-Dsysconfdir=/etc",
            "-Ddatadir=/usr/share",
            "-Dversion=0.1.0-dev.20260909+g294212ebd35f5b755062186a66bcfd6436d3627a",
        },
        dependencies = { "zig@0.16.0" },
        patches = {
            [=[--- a/build.zig
+++ b/build.zig
@@ -23,7 +23,7 @@
         "lto",
         "Link-time optimization (none, thin, full; default: none)",
     ) orelse .none;
-    const version = versionString(b);
+    const version = b.option([]const u8, "version", "Exact version for source snapshot builds") orelse versionString(b);
     const build_config = b.addOptions();
     build_config.addOption([]const u8, "version", version);
 
--- a/src/file_util.zig
+++ b/src/file_util.zig
@@ -22,3 +22,16 @@
     }
     return bytes.toOwnedSlice(allocator);
 }
+
+/// Returns an owned executable-relative data directory when available.
+pub fn executableDataDir(allocator: std.mem.Allocator) !?[]u8 {
+    if (comptime @import("builtin").cpu.arch.isWasm()) return null;
+
+    const io = std.Io.Threaded.global_single_threaded.io();
+    var executable_buffer: [std.fs.max_path_bytes]u8 = undefined;
+    const executable_len = std.process.executablePath(io, &executable_buffer) catch return null;
+    var real_buffer: [std.fs.max_path_bytes]u8 = undefined;
+    const real_len = std.Io.Dir.cwd().realPathFile(io, executable_buffer[0..executable_len], &real_buffer) catch return null;
+    const bin_dir = std.fs.path.dirname(real_buffer[0..real_len]) orelse return null;
+    return try std.fs.path.resolve(allocator, &.{ bin_dir, "..", "share" });
+}
--- a/src/function_autoload.zig
+++ b/src/function_autoload.zig
@@ -4,6 +4,7 @@
 const build_config = @import("build_config");
 
 const host = @import("host.zig");
+const file_util = @import("file_util.zig");
 const shell = @import("shell.zig");
 
 const max_function_source_bytes = 1024 * 1024;
@@ -87,6 +88,10 @@
     try appendUserDataDir(allocator, sh, &data_dirs);
     try appendXdgDataDirs(allocator, sh, &data_dirs);
     try appendPath(allocator, &data_dirs, &.{ build_config.datadir, "rush", "functions" });
+    if (try file_util.executableDataDir(allocator)) |data_dir| {
+        defer allocator.free(data_dir);
+        try appendPath(allocator, &data_dirs, &.{ data_dir, "rush", "functions" });
+    }
 
     var paths: std.ArrayList([]const u8) = .empty;
     errdefer freePathList(allocator, &paths);
--- a/src/completion.zig
+++ b/src/completion.zig
@@ -9,6 +9,7 @@
 const extensions = @import("extensions.zig");
 const history = @import("history.zig");
 const host = @import("host.zig");
+const file_util = @import("file_util.zig");
 const shell = @import("shell.zig");
 
 pub const Application = editor_completion.Application;
@@ -1114,6 +1115,10 @@
         if (try findCompletionFileUnder(allocator, sh, part, file_name)) |path| return path;
     }
     if (try findCompletionFileUnder(allocator, sh, build_config.datadir, file_name)) |path| return path;
+    if (try file_util.executableDataDir(allocator)) |data_dir| {
+        defer allocator.free(data_dir);
+        if (try findCompletionFileUnder(allocator, sh, data_dir, file_name)) |path| return path;
+    }
     return null;
 }
 
]=],
        },
    },
    systems = { "aarch64-macos", "x86_64-macos", "aarch64-linux", "x86_64-linux" },
    bins = { "rush" },
    checks = {
        { "rush", "--version" },
        {
            "rush",
            "-ec",
            '[ "$((2 + 3))" = 5 ]; value=$(printf "%s" "a b"); [ "$value" = "a b" ]; path_prepend /usr/bin; [ "${PATH%%:*}" = /usr/bin ]',
        },
        {
            "rush",
            "-ec",
            '[ "$("$0" --version)" = "rush 0.1.0-dev.20260909+g294212ebd35f5b755062186a66bcfd6436d3627a" ]',
        },
    },
    versions = {
        ["0.1.0-dev.20260909+g294212ebd35f5b755062186a66bcfd6436d3627a"] = {
            sha256 = "b7eb240c58b7de30a80f1a2f27d1273effa1a1785d670ea6917995e5803422b6",
        },
    },
}
