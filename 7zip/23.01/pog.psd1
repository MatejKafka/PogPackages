@{
	Name = "7zip"
	Architecture = "x64"
	Version = "23.01"
	
	Install = @{
		Url = "https://www.7-zip.org/a/7z2301-x64.exe"
		Hash = "26CB6E9F56333682122FAFE79DBCDFD51E9F47CC7217DCCD29AC6FC33B5598CD"
	}

	Enable = {
		# do NOT export the GUI apps, as they write to the registry
		
		# 7z is looking for 7z.dll in its directory, so we cannot use symlink
		Export-Command "7z" "./app/7z.exe"
	}
}
