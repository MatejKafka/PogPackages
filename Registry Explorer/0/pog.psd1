@{
	Name = 'Registry Explorer'
	Architecture = 'x64'
	Version = '0'

	Install = @{
		Url = "https://f001.backblazeb2.com/file/EricZimmermanTools/net6/RegistryExplorer.zip"
	}

	Enable = {
		Set-SymlinkedPath "./app/Settings" "./data/Settings" Directory
		Set-SymlinkedPath "./app/Bookmarks/User" "./data/UserBookmarks" Directory
		Set-SymlinkedPath "./app/logs" "./logs" Directory

		Disable-DisplayScaling "./app/RegistryExplorer.exe"

		Export-Shortcut "Registry Explorer" "./app/RegistryExplorer.exe"
	}
}