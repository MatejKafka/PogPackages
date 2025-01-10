@{
	Name = 'Rufus'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
		NoArchive = $true
		Target = "rufus-p.exe"
	}

	Enable = {
		New-Directory "./config"
		New-File "./config/rufus.ini" {"UpdateCheckInterval = -1`n"}
		New-Symlink "./app/rufus.ini" "./config/rufus.ini" File

		# this directory is used by Rufus to store downloaded syslinux versions and logs
		New-Symlink "./app/Rufus" "./data" Directory

		New-Directory "./logs"
		New-Symlink "./data/rufus.log" "./logs/rufus.log" File

		Export-Shortcut "Rufus" "./app/rufus-p.exe"
	}
}
