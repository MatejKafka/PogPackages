@{
	Name = 'Rufus'
	Architecture = 'x64'
	Version = '3.20'

	Install = @{
		Url = {$V = $this.Version; "https://github.com/pbatard/rufus/releases/download/v${V}/rufus-${V}p.exe"}
		Hash = "042F0B284AF6E3316BAF6235A4F0141966A051873B5631C7E5A724CF1F5E7973"
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
