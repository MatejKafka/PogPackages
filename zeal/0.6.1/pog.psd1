@{
	Name = 'zeal'
	Architecture = 'x64'
	Version = '0.6.1'

	Install = @{
		Url = {$V = $this.Version; "https://github.com/zealdocs/zeal/releases/download/v${V}/zeal-portable-${V}-windows-x64.7z"}
		Hash = "08E9992F620BA0A5EA348471D8AC9C85059E95EEDD950118928BE639746E3F94"
	}

	Enable = {
		New-Symlink "./app/zeal.ini" "./data/zeal.ini" File
		New-Symlink "./app/docsets" "./data/docsets" Directory
		New-Symlink "./app/cache" "./cache" Directory

		Export-Shortcut Zeal "./app/zeal.exe"
	}
}
