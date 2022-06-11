@echo off
setlocal

set "root=%~dp0"
:: get parent dir
for %%a in ("%root:~0,-1%") do set "root=%%~dpa"

:: directory for Inkscape data
set "INKSCAPE_PROFILE_DIR=%root%data"
:: recently-used.xbel, created by GTK
set "XDG_DATA_HOME=%root%data"
:: fontconfig font cache configuration; otherwise, it would be written to LOCALAPPDATA;
::  apparently, there isn't an environment variable to directly configure the cache path;
::  instead, we have to create a config file and direct fontconfig to use it
set "FONTCONFIG_FILE=%~dp0\fontconfig.conf.xml"
:: .dbus-keyring directory is stored in HOME
set "HOME=%root%data"

start "" "%root%app\bin\inkscape.exe"
