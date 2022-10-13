@{
	Name = "lz4"
	Architecture = "x64"
	Version = "1.9.4"

	Install = @{
		Url = "https://github.com/lz4/lz4/releases/download/v1.9.4/lz4_win64_v1_9_4.zip"
		Hash = "13CE1D4FC1C50B8387612549E63A0D3522B253F2C3BB66BEEB47DEE4923CC9B3"
	}

	Enable = {
		Export-Command "lz4" "./app/lz4.exe"
	}
}