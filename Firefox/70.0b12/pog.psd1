@{
	Name = "Firefox"
	Architecture = "x64"
	Version = "70.0b12"
	
	Install = @{
		# the installer is .exe, but actually it's a self-extracting 7zip archive
		Url = {$V = $this.Version; "https://releases.mozilla.org/pub/firefox/releases/${V}/win64/en-US/Firefox Setup ${V}.exe"}
		Hash = "68DE1952FB6287BC2FD458412D922B7FA2F9AD4E609D15602E0368B3A7E6E157"
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
