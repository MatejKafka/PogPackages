@{
	Name = "ProduKey"
	Architecture = "x64"
	Version = "0"

	Install = @{
		# the archive is updated whenever a new version is released
		Url = "https://www.nirsoft.net/utils/produkey-x64.zip"
	}

	Enable = {
		New-Symlink "./app/ProduKey.cfg" "./config/ProduKey.cfg" File

		Export-Command "ProduKey" "./app/ProduKey.exe"
		Export-Shortcut "ProduKey" "./app/ProduKey.exe"
	}
}
