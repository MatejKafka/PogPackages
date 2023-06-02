@{
	Name = 'OpenOCD'
	Architecture = 'x64'
	Version = '0.12.0'

	Install = @{
		Url = "https://github.com/openocd-org/openocd/releases/download/v0.12.0/openocd-v0.12.0-i686-w64-mingw32.tar.gz"
		Hash = "D7168545A6D5DF4772B6090D470650F3EB8C9732DBD19B1F9027824C7F4A6FA3"
	}

	Enable = {
		Export-Command "openocd" "./app/bin/openocd.exe"
	}
}
