@{
	Name = 'win-vind'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = {$V = $this.Version; "https://github.com/pit-ray/win-vind/releases/download/v${V}/win-vind_${V}_64bit_portable.zip"}
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		New-Symlink "./app/config" "./config" Directory
		New-Symlink "./app/log" "./logs" Directory

		New-File "./config/.vindrc"

		Export-Command "win-vind" "./app/win-vind.exe"
		Export-Shortcut "win-vind" "./app/win-vind.exe"
	}
}