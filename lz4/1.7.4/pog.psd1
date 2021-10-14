@{
	Name = "lz4"
	Architecture = "x64"
	Version = "1.7.4"

	Install = @{
		Url = "https://github.com/lz4/lz4/releases/download/v1.7.4/lz4_v1_7_4_win64.zip"
		Hash = "D97B3C8F2345539036391D531E360AE1751B7722DC6B4610706C21C68757D8D5"
	}

	Enable = {
		Export-Command "lz4" "./app/lz4.exe"
	}
}