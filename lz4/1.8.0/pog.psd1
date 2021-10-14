@{
	Name = "lz4"
	Architecture = "x64"
	Version = "1.8.0"

	Install = @{
		Url = "https://github.com/lz4/lz4/releases/download/v1.8.0/lz4_v1_8_0_win64.zip"
		Hash = "4516A5F92C024FB7227512A3F1E993BB4FA0A9739881C14242D941B303C46AB9"
	}

	Enable = {
		Export-Command "lz4" "./app/lz4.exe"
	}
}