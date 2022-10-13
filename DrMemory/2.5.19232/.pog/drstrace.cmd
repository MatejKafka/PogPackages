@echo off
setlocal

:: get parent dir
set "package-dir=%~dp0"
for %%a in ("%package-dir:~0,-1%") do set "package-dir=%%~dpa"

set "DYNAMORIO_CONFIGDIR=%package-dir%data"
"%~dp0\..\app\bin64\drstrace.exe" -logdir "%package-dir%logs" -symcache_path "%package-dir%cache\symcache" %*
