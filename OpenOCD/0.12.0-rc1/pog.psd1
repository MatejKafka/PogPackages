@{
	Name = 'OpenOCD'
	Architecture = 'x64'
	Version = '0.12.0-rc1'

	Install = @{
		Url = "https://github.com/openocd-org/openocd/releases/download/v0.12.0-rc1/openocd-v0.12.0-rc1-i686-w64-mingw32.tar.gz"
		Hash = "FDE616378CE4CA2C173F8AD0924F46FA5EE1421CF5153E5FD40023A49D52AD43"
	}

	Enable = {
		Export-Command "openocd" "./app/bin/openocd.exe" -NoSymlink
	}
}
