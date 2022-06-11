@{
	Name = "7zip"
	Architecture = "x64"
	Version = "21.06"
	
	Install = @{
		Url = "https://www.7-zip.org/a/7z2106-x64.exe"
		Hash = "7E7436175B708D60816B186B7AFB72F2F000334A77E7636460630C895B2A75FF"
	}

	Enable = {
		# do NOT export the GUI apps, as they write to the registry
		
		# 7z is looking for 7z.dll in its directory, so we cannot use symlink
		Export-Command "7z" "./app/7z.exe" -NoSymlink
	}
}
