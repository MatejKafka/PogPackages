@{
	Name = 'DesktopClock@danielchalmers'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = {"https://github.com/danielchalmers/DesktopClock/releases/download/v$($this.Version)/DesktopClock.exe"}
		Hash = '{{TEMPLATE:Hash}}'
		NoArchive = $true
		Target = "DesktopClock.exe"
	}

	Enable = {
		New-Symlink "./app/DesktopClock.settings" "./config/DesktopClock.settings" File
		Export-Shortcut "DesktopClock" "./app/DesktopClock.exe"
	}
}