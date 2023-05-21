@echo off

set "GH_CONFIG_DIR=%~dp0\..\config"
set "XDG_DATA_HOME=%~dp0\..\data"
set "XDG_STATE_HOME=%~dp0\..\data"

"%~dp0\..\app\bin\gh.exe" %*
