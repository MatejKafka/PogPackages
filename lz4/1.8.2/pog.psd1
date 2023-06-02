@{
	Name = "lz4"
	Architecture = "x64"
	Version = "1.8.2"

	Install = @{
		Url = "https://github.com/lz4/lz4/releases/download/v1.8.2/lz4_v1_8_2_win64.zip"
		Hash = "C6382B7C0B05ACEAB33F5563DEB49DC79F1F2479C56C50A900610ABE41AAD3EB"
	}

	Enable = {
		Export-Command "lz4" "./app/lz4.exe" -Symlink
	}
}