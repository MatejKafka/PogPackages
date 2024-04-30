@{
	Name = "PDF Arranger"
	Architecture = "x64"
	Version = "1.9.0"

	Install = @{
		Url = {$V = $this.Version; "https://github.com/pdfarranger/pdfarranger/releases/download/${V}/pdfarranger-${V}-windows-portable.zip"}
		Hash = "854E3E4AA6F11F7EE7B8FE9EA7F869706A09E5BD6BDB2FDFC7EB1723792837C6"
	}

	Enable = {
		New-Directory "./config"

		# when pdfarranger sees this file, it switches to portable mode
		New-Symlink "./app/config.ini" "./config/config.ini" File

		Export-Shortcut "PDF Arranger" "./app/pdfarranger.exe"
	}
}
