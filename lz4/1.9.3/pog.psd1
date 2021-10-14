@{
	Name = "lz4"
	Architecture = "x64"
	Version = "1.9.3"

	Install = @{
		Url = "https://github.com/lz4/lz4/releases/download/v1.9.3/lz4_win64_v1_9_3.zip"
		Hash = "519CB3BFC4975CCE8747B1ECBA5053137B6CE2A77B653E4D2C63FAE057985449"
	}

	Enable = {
		Export-Command "lz4" "./app/lz4.exe"
	}
}