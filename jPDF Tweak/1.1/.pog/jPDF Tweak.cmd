@echo off

:: this must be added to PATH, otherwise the program won't find the jmupdf64.dll library
set "PATH=%~dp0\..\app;%PATH%"

start "" javaw -jar "%~dp0\..\app\jpdftweak.jar" %*
