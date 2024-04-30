@{
	Name = 'Registry Explorer'
	Architecture = 'x64'
	Version = '0'

	Install = @{
		Url = "https://f001.backblazeb2.com/file/EricZimmermanTools/net6/RegistryExplorer.zip"
	}

	Enable = {
		New-Symlink "./app/Settings" "./data/Settings" Directory
		New-Symlink "./app/Bookmarks/User" "./data/UserBookmarks" Directory
		New-Symlink "./app/logs" "./logs" Directory

		Disable-DisplayScaling "./app/RegistryExplorer.exe"

		Export-Shortcut "Registry Explorer" "./app/RegistryExplorer.exe"
	}
}