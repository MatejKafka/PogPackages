@{
	Name = "OpenedFilesView"
	Architecture = "x64"
	Version = "1.8.6"

	Install = @{
		# it seems the file is replaced when a new version comes out, but
		# the last version (1.8.6) is from 2018, so the hash shouldn't change too often
		Url = "http://www.nirsoft.net/utils/ofview-x64.zip"
		Hash = "A250CFE10A4CF8FE3044508C1D07BDDCE45809467D867977BED1FA9F5F6D2C9C"
	}

	Enable = {
		Set-SymlinkedPath "./app/OpenedFilesView.cfg" "./config/OpenedFilesView.cfg" File

		Export-Command "OpenedFilesView" "./app/OpenedFilesView.exe"
		Export-Shortcut "OpenedFilesView" "./app/OpenedFilesView.exe"
	}
}
