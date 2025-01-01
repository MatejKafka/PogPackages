@{
	Name = 'Lapce'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = {"https://github.com/lapce/lapce/releases/download/v$($this.Version)/Lapce-windows-portable.zip"}
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		New-Symlink "./app/lapce-data/data" "./data" Directory
		New-Symlink "./app/lapce-data/config" "./config" Directory

		Export-Command "lapce" "./app/lapce.exe"
		Export-Shortcut "Lapce" "./app/lapce.exe"
	}
}