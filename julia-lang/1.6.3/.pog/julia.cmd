@echo off

:: get package dir
set "PACKAGE_DIR=%~dp0"
for %%a in ("%PACKAGE_DIR:~0,-1%") do set "PACKAGE_DIR=%%~dpa"

set "JULIA_DEPOT_PATH=%PACKAGE_DIR%data;%PACKAGE_DIR%app\local\share\julia;%PACKAGE_DIR%app\share\julia"

"%PACKAGE_DIR%app\bin\julia.exe" %*