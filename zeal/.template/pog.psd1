@{
	Name = 'zeal'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		New-Symlink "./app/zeal.ini" "./data/zeal.ini" File
		New-Symlink "./app/docsets" "./data/docsets" Directory
		New-Symlink "./app/cache" "./cache" Directory

		Export-Shortcut Zeal "./app/zeal.exe" -VcRedist
	}
}
