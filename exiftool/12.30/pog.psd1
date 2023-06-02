@{
	Name = "exiftool"
	Architecture = "x64"
	Version = "12.30"
	
	Install = @{
		Url = {"https://oliverbetz.de/cms/files/Artikel/ExifTool-for-Windows/exiftool-$($this.Version)_64.zip"}
		Hash = "37CA3B2FAF6068FB2F557D626458CB4A2639340E3D2E278FC993595B34F5036A"
	}
	
	Enable = {
		Export-Command "exiftool" "./app/ExifTool.exe"
	}
}
