@echo off

SET "PACKAGE_DIR=%~dp0\.."
set "SPICETIFY_CONFIG=%PACKAGE_DIR%\config"

"%PACKAGE_DIR%\app\spicetify.exe" %*