@echo off

setlocal
:: set these for all entry points, as they might call each other internally
set "NODE_REPL_HISTORY=%~dp0\..\data\node\node_repl_history.txt"
set "NPM_CONFIG_USERCONFIG=%~dp0\..\config\npmrc"
set "NPM_CONFIG_GLOBALCONFIG=%~dp0\..\config\npmrc"

"%~dp0\..\app\node.exe" %*