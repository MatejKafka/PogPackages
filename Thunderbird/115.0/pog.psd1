@{
	Name = 'Thunderbird'
	Architecture = 'x64'
	Version = '115.0'

	Install = @{
		# the installer is .exe, but actually it's a self-extracting 7zip archive
		Url = {$V = $this.Version; "https://download-installer.cdn.mozilla.net/pub/thunderbird/releases/${V}/win64/en-US/Thunderbird%20Setup%20${V}.exe"}
		Hash = "599E136AABBD2FB328BADEA1476D9A931EEBF765CF58080C01CF0A089EFFCA23"
		Subdirectory = "core"
	}

	Enable = {
		Write-Warning "Thunderbird updater and crash reporter write to registry (HKCU\Software\Mozilla\Thunderbird)."

		Assert-Directory "./data"
		Assert-Directory "./config"
		Assert-Directory "./cache"

		Set-SymlinkedPath "./data/datareporting" "./cache/datareporting" Directory
		Set-SymlinkedPath "./data/cache2" "./cache/cache2" Directory

		Export-Shortcut "Thunderbird" "./.pog/thunderbird.cmd" -IconPath "./app/thunderbird.exe"
	}
}
