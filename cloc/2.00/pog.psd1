@{
	Name = 'cloc'
	Architecture = 'x64'
	Version = '2.00'

	Install = @{
		Url = {$V = $this.Version; "https://github.com/AlDanial/cloc/releases/download/v${V}/cloc-${V}.exe"}
		Hash = "7A234EF0CB495DE1B5776ACF88C5554E2BAB1FB02725A5FB85756A6DB3121C1F"
		NoArchive = $true
		Target = "cloc.exe"
	}

	Enable = {
		New-File "./config/options.txt"

		Export-Command "cloc" "./app/cloc.exe" -Arguments @("--config", "./config/options.txt")
	}
}