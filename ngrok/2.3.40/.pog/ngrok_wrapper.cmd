@echo off

:: get package dir
set "package_dir=%~dp0"
for %%a in ("%package_dir:~0,-1%") do set "package_dir=%%~dpa"

:: check if any command was passed
if "%~1"=="" goto WithoutConfig

if "%1" == "version" goto WithoutConfig
if "%1" == "help" goto WithoutConfig
if "%1" == "credits" goto WithoutConfig
if "%1" == "update" goto WithoutConfig
if "%1" == "-v" goto WithoutConfig

:: with config
"%package_dir%app\ngrok.exe" %* --config "%package_dir%config\ngrok.yml"
exit /b %errorlevel%

:WithoutConfig
"%package_dir%app\ngrok.exe" %*
exit /b %errorlevel%