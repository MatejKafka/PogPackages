@echo off

set "APP_DIR=%~dp0\..\app"
set "CONFIG_DIR=%~dp0\..\config"

:: Change the code page for UTF8
chcp 65001 >NUL
set PYTHONIOENCODING=cp65001

"%APP_DIR%\python\python.exe" "%APP_DIR%\streamlink-script.py" --ffmpeg-ffmpeg "%APP_DIR%\ffmpeg\ffmpeg.exe" --config "%CONFIG_DIR%" %*
