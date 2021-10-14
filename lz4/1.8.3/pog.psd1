@{
	Name = "lz4"
	Architecture = "x64"
	Version = "1.8.3"

	Install = @{
		Url = "https://github.com/lz4/lz4/releases/download/v1.8.3/lz4_v1_8_3_win64.zip"
		Hash = "4FC382DA9A2421DE0C12D5D6BC18384694DB33FCFDBAFA2D8302D785757D69DB"
	}

	Enable = {
		Export-Command "lz4" "./app/lz4.exe"
	}
}