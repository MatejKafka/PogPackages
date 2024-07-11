@{
	Name = 'WindowsSpyBlocker'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = {"https://github.com/crazy-max/WindowsSpyBlocker/releases/download/$($this.Version)/WindowsSpyBlocker.exe"}
		Hash = '{{TEMPLATE:Hash}}'
		NoArchive = $true
		Target = 'WindowsSpyBlocker.exe'
	}

	Enable = {
		New-File "./config/app.conf" {'{}'}

		New-Symlink "./app/app.conf" "./config/app.conf" File
		New-Symlink "./app/libs" "./data/libs" Directory
		New-Symlink "./app/tmp" "./cache" Directory
		New-Symlink "./app/logs" "./logs" Directory

		Export-Shortcut "Windows Spy Blocker" "./app/WindowsSpyBlocker.exe"
		Export-Command "WindowsSpyBlocker" "./app/WindowsSpyBlocker.exe" -ReplaceArgv0
	}
}