@echo off

SET "PACKAGE_DIR=%~dp0\.."

SET   "IDEA_PROPERTIES=%PACKAGE_DIR%\config\idea.properties"
SET   "IDEA_VM_OPTIONS=%PACKAGE_DIR%\config\idea.exe.vmoptions"
SET "IDEA64_VM_OPTIONS=%PACKAGE_DIR%\config\idea64.exe.vmoptions"

start "" "%PACKAGE_DIR%\app\bin\idea64.exe" %*