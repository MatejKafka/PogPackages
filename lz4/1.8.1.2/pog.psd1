@{
	Name = "lz4"
	Architecture = "x64"
	Version = "1.8.1.2"

	Install = @{
		Url = "https://github.com/lz4/lz4/releases/download/v1.8.1.2/lz4_v1_8_1_win64.zip"
		Hash = "C0CE918E7DEE4FBC7AE22FF9CDCE1DDA0A20124D6D7F8595427F3DE22C700D7C"
	}

	Enable = {
		Export-Command "lz4" "./app/lz4.exe" -Symlink
	}
}