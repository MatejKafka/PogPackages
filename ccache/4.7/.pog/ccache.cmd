@echo off

set "CCACHE_DIR=%~dp0\..\cache"
"%~dp0\..\app\ccache.exe" %*
