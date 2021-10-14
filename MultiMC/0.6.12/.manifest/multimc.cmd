@echo off
setlocal

set "root_dir=%~dp0"
:: get parent dir
for %%a in ("%root_dir:~0,-1%") do set "root_dir=%%~dpa"

start "" "%root_dir%app\MultiMC.exe" --dir "%root_dir%data" %*