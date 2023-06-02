@{
	Name = "lz4"
	Architecture = "x64"
	Version = "1.9.0"

	Install = @{
		Url = "https://github.com/lz4/lz4/releases/download/v1.9.0/lz4_v1_9_0_win64.zip"
		Hash = "42D44F74FCAFA6BB0BA7FFAD53571C4AB49B56465C33594BB9F639A758492EAB"
	}

	Enable = {
		Export-Command "lz4" "./app/lz4.exe" -Symlink
	}
}