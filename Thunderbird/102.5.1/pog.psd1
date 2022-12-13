@{
	Name = 'Thunderbird'
	Architecture = 'x64'
	Version = '102.5.1'

	Install = @{
		# the installer is .exe, but actually it's a self-extracting 7zip archive
		Url = {$V = $this.Version; "https://download-installer.cdn.mozilla.net/pub/thunderbird/releases/${V}/win64/en-US/Thunderbird%20Setup%20${V}.exe"}
		Hash = "30B826D7650BE5716A00975537AD361ABFFE9C2990168792FCB2B6884D64F057"
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
