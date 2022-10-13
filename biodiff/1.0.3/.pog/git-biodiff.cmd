@echo off

setlocal
set "BIODIFF_CONFIG_DIR=%~dp0\..\config"

"%~dp0\..\app\git-biodiff.exe" %*
