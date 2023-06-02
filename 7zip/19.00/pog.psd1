@{
	Name = "7zip"
	Architecture = "x64"
	Version = "19.00"
	
	Install = @{
		Url = "https://www.7-zip.org/a/7z1900-x64.exe"
		Hash = "0F5D4DBBE5E55B7AA31B91E5925ED901FDF46A367491D81381846F05AD54C45E"
	}
	
	Enable = {
		# do NOT export the GUI apps, as they write to the registry
		
		# 7z is looking for 7z.dll in its directory, so we cannot use symlink
		Export-Command "7z" "./app/7z.exe"
	}
}
