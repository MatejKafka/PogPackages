@{
	Name = "7zip"
	Architecture = "x64"
	Version = "21.07"
	
	Install = @{
		Url = "https://www.7-zip.org/a/7z2107-x64.exe"
		Hash = "0B461F0A0ECCFC4F39733A80D70FD1210FDD69F600FB6B657E03940A734E5FC1"
	}

	Enable = {
		# do NOT export the GUI apps, as they write to the registry
		
		# 7z is looking for 7z.dll in its directory, so we cannot use symlink
		Export-Command "7z" "./app/7z.exe" -NoSymlink
	}
}
