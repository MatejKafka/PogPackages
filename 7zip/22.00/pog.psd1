@{
	Name = "7zip"
	Architecture = "x64"
	Version = "22.00"
	
	Install = @{
		Url = "https://www.7-zip.org/a/7z2200-x64.exe"
		Hash = "0B01C258A2E9857DE86BD845DEEF59953CFF283E6ED030DBA3DA529262484B00"
	}

	Enable = {
		# do NOT export the GUI apps, as they write to the registry
		
		# 7z is looking for 7z.dll in its directory, so we cannot use symlink
		Export-Command "7z" "./app/7z.exe"
	}
}
