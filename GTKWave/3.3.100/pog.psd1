@{
	Name = 'GTKWave'
	Architecture = 'x64'
	Version = '3.3.100'

	Install = @{
		Url = "https://sourceforge.net/projects/gtkwave/files/gtkwave-3.3.100-bin-win64/gtkwave-3.3.100-bin-win64.zip/download"
		Hash = "CACE98E9C1E5BB6AB74AC2C4C1A2913617B6DB7071418D052D2CF999A1ACF39D"
		UserAgent = "Wget"
	}

	Enable = {
		New-File "./config/gtkwave.ini"

		Export-Command "gtkwave" "./app/bin/gtkwave.exe" -Arguments @("--rcfile=" + (Resolve-Path "./config/gtkwave.ini"))
		Export-Shortcut "GTKWave" "./app/bin/gtkwave.exe" -Arguments @("--rcfile=" + (Resolve-Path "./config/gtkwave.ini"))
	}
}
