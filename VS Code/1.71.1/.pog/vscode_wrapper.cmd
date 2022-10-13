@echo off
setlocal
set "VSCODE_PORTABLE=%~dp0..\data\"
start "" "%~dp0..\app\Code.exe" %*
endlocal
