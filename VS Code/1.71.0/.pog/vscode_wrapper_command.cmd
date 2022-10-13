@echo off
setlocal
set "VSCODE_PORTABLE=%~dp0..\data\"
"%~dp0..\app\Code.exe" %*
endlocal
