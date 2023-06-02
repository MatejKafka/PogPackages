@{
	Name = "7zip"
	Architecture = "x64"
	Version = "22.01"
	
	Install = @{
		Url = "https://www.7-zip.org/a/7z2201-x64.exe"
		Hash = "B055FEE85472921575071464A97A79540E489C1C3A14B9BDFBDBAB60E17F36E4"
	}

	Enable = {
		# do NOT export the GUI apps, as they write to the registry
		
		# 7z is looking for 7z.dll in its directory, so we cannot use symlink
		Export-Command "7z" "./app/7z.exe"
	}
}
