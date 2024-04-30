@{
	Name = "Snipaste"
	Architecture = "x64"
	Version = "2.7.3"

	Install = @{
		Url = {"https://bitbucket.org/liule/snipaste/downloads/Snipaste-$($this.Version)-Beta-x64.zip"}
		Hash = "6E647D9D7946EF83DB435612DFAF76B6EBB9888B9B5476129449215622EDAE1D"
	}

	Enable = {
		New-Directory "./config"
		New-Directory "./data"
		New-Directory "./logs"

		New-Symlink "./app/config.ini" "./config/config.ini" File
		New-Symlink "./app/splog.txt" "./logs/splog.txt" File
		New-Symlink "./app/crashes" "./data/crashes" Directory
		New-Symlink "./app/history" "./data/history" Directory

		Export-Shortcut "Snipaste" "./app/Snipaste.exe"

		# TODO: disable updates by adding the following to config.ini:
		# [Update]
		# check_on_start=false
	}
}
