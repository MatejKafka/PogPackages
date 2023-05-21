@echo off

setlocal

set "package_dir=%~dp0"
for %%a in ("%package_dir:~0,-1%") do set "package_dir=%%~dpa"

set "APPDATA=%package_dir%data"
set "LOCALAPPDATA=%package_dir%cache"

"%package_dir%app\carapace.exe" %*
