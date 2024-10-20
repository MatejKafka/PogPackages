@{
	Name = "OpenedFilesView"
	Architecture = "x64"
	Version = "1.8.7"

	Install = @{
		# normally, there's just a single file, which is updated from time to time
		# however, for version 1.8.7, a fixed-URL archive was released, so let's use it :)
		Url = "https://www.nirsoft.net/utils/ofview-x64-187.zip"
		Hash = "1CD0A58BFEECB1CBCF5D0311CD3BB830619D443A48CAB77801544A5F67AF890C"
	}

	Enable = {
		New-Symlink "./app/OpenedFilesView.cfg" "./config/OpenedFilesView.cfg" File

		Disable-DisplayScaling "./app/OpenedFilesView.exe"

		Export-Command "OpenedFilesView" "./app/OpenedFilesView.exe"
		Export-Shortcut "OpenedFilesView" "./app/OpenedFilesView.exe"
	}
}
