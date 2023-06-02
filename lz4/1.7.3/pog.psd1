@{
	Name = "lz4"
	Architecture = "x64"
	Version = "1.7.3"

	Install = @{
		Url = "https://github.com/lz4/lz4/releases/download/v1.7.3/lz4_v1_7_3_win64.zip"
		Hash = "B09C9DE452575A58135932E7C2514998232D76E4A4CC625B5A789BEFE9D43A88"
	}

	Enable = {
		Export-Command "lz4" "./app/lz4.exe" -Symlink
	}
}