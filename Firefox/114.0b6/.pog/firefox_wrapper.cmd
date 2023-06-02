@echo off
setlocal

set "PACKAGE_DIR=%~dp0\.."
set "PROFILE=%PACKAGE_DIR%\data"

:: disable crash reporter, it writes to AppData
set "MOZ_CRASHREPORTER_DISABLE=1"

:: FIXME: these are apparently internal, and Firefox overrides them when starting the crash reporter
::SET "MOZ_CRASHREPORTER_DATA_DIRECTORY=%PACKAGE_DIR%\cache\crashreporter"
::SET "MOZ_CRASHREPORTER_EVENTS_DIRECTORY=%PACKAGE_DIR%\cache\events"
::SET "MOZ_CRASHREPORTER_PING_DIRECTORY=%PACKAGE_DIR%\cache\pings"

start "" "%PACKAGE_DIR%\app\firefox.exe" --allow-downgrade -profile "%PROFILE%" %*
