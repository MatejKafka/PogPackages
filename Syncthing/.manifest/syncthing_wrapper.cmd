@echo off

set STNODEFAULTFOLDER=true
%~dp0\..\app\syncthing.exe -data "%~dp0\..\data" -config "%~dp0\..\config" -logfile "%~dp0\..\logs\syncthing.log" %*