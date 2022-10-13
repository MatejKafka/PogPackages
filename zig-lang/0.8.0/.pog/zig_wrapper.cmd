@echo off
setlocal

:: get absolute path to zig cache dir, zig seems to dislike \..\ in the cache path
:: batch files are absolutely atrocious and this is the simplest way I could find
set "zig-cache-dir=%~dp0"
:: get parent dir
for %%a in ("%zig-cache-dir:~0,-1%") do set "zig-cache-dir=%%~dpa"
:: get cache dir
set "zig-cache-dir=%zig-cache-dir%cache"

:: https://ziglang.org/download/0.8.0/release-notes.html#Environment-Variable-Alternatives-to-CLI-Options
set "ZIG_GLOBAL_CACHE_DIR=%zig-cache-dir%"

"%~dp0\..\app\zig.exe" %*
