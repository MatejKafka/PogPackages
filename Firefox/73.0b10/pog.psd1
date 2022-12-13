@{
	Name = "Firefox"
	Architecture = "x64"
	Version = "73.0b10"
	
	Install = @{
		# the installer is .exe, but actually it's a self-extracting 7zip archive
		Url = {$V = $this.Version; "https://releases.mozilla.org/pub/firefox/releases/${V}/win64/en-US/Firefox Setup ${V}.exe"}
		Hash = "154BEFB2F6CAD49F3F841E1E8B41DAD4760B7E1C0F9221D6BD5C38F9685D8F6F"
		Subdirectory = "core"
	}
	
	Enable = {
		Write-Warning "Firefox updater and crash reporter write to registry (HKCU\Software\Mozilla\Firefox)."

		Assert-Directory "./data"
		Assert-Directory "./config"
		Assert-Directory "./cache"

		Set-SymlinkedPath "./data/datareporting" "./cache/datareporting" Directory
		Set-SymlinkedPath "./data/cache2" "./cache/cache2" Directory

		# add symlinks for easier editing
		Set-SymlinkedPath "./config/userChrome.css" "./data/chrome/userChrome.css" File
		Set-SymlinkedPath "./config/userContent.css" "./data/chrome/userContent.css" File
		# TODO: add other user-editable files as symlinks

		Export-Shortcut "Firefox" "./.pog/firefox_wrapper.cmd" -IconPath "./app/firefox.exe"
	}
}
