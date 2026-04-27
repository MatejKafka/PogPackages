@{
	Name = 'win-vind'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Website = 'https://pit-ray.github.io/win-vind/'
	Description = 'Hybrid UI system to operate Windows with Vim-like key bindings.'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
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