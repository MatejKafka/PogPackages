@{
	Name = "lz4"
	Architecture = "x64"
	Version = "1.9.1"

	Install = @{
		Url = "https://github.com/lz4/lz4/releases/download/v1.9.1/lz4_v1_9_1_win64.zip"
		Hash = "541BD97E3A055127FB5136A87BE6043088AFBED7CBBA3E828746DF81D50A0F0D"
	}

	Enable = {
		Export-Command "lz4" "./app/lz4.exe"
	}
}