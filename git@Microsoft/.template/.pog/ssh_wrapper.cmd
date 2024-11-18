@echo off
:: SSH wrapper used by git (configured using `GIT_SSH`)
:: resets HOME and PATH back to original value for SSH

set "HOME=%ORIG_HOME%"
set "PATH=%ORIG_PATH%"

ssh %*