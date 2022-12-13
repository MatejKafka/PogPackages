@{
	Name = "Firefox"
	Architecture = "x64"
	Version = "70.0b9"
	
	Install = @{
		# the installer is .exe, but actually it's a self-extracting 7zip archive
		Url = {$V = $this.Version; "https://releases.mozilla.org/pub/firefox/releases/${V}/win64/en-US/Firefox Setup ${V}.exe"}
		Hash = "1CD18AE77BC444AC0600037A6C089D0F95EB5BDC5DF570FB13395B0554049310"
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
