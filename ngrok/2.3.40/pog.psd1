@{
	Name = "ngrok"
	Version = "2.3.40"
	Architecture = "x64"

	# https://dl.equinox.io/ngrok/ngrok/stable/archive
	Install = @{
		Url = "https://bin.equinox.io/a/8exBtGpBr59/ngrok-2.3.40-windows-amd64.zip"
		Hash = "778cbe4d5f1c868a5687a97206bf39b017a76fc44eaead95a11cf8a415c2e505"
		SetupScript = {
			Set-Content "./pog_ngrok_wrapper.cmd" $this._NgrokWrapper -NoNewline
		}
	}

	Enable = {
		New-Directory "./config"
		New-File "./config/ngrok.yml"

		Export-Command "ngrok" "./app/pog_ngrok_wrapper.cmd"
	}

	# ngrok only accepts `--config` parameter on some subcommands,
	#  which the Pog shim cannot currently handle, so we use a batch file
	_NgrokWrapper = @'
@echo off

:: get package dir
set "package_dir=%~dp0"
for %%a in ("%package_dir:~0,-1%") do set "package_dir=%%~dpa"

:: check if any command was passed
if "%~1"=="" goto WithoutConfig

if "%1" == "version" goto WithoutConfig
if "%1" == "help" goto WithoutConfig
if "%1" == "credits" goto WithoutConfig
if "%1" == "update" goto WithoutConfig
if "%1" == "-v" goto WithoutConfig

:: with config
set ngrok_subcommand=%1
:: extract the remaining arguments
for /f "tokens=1,* delims= " %%a in ("%*") do set args=%%b
"%package_dir%app\ngrok.exe" "%ngrok_subcommand%" --config "%package_dir%config\ngrok.yml" %args%
exit /b %errorlevel%

:WithoutConfig
"%package_dir%app\ngrok.exe" %*
exit /b %errorlevel%
'@
}
