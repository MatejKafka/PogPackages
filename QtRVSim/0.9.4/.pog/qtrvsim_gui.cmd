@echo off

set "QTRVSIM_CONFIG_FILE=%~dp0\..\data\qtrvsim_gui.ini"
"%~dp0\..\app\qtrvsim_gui.exe" %*
