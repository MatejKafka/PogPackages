@{
	Name = 'PdfToSvg.NET'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = {"https://github.com/dmester/pdftosvg.net/releases/download/$($this.Version)/pdftosvg.exe"}
		Hash = '{{TEMPLATE:Hash}}'
		NoArchive = $true
		Target = "pdftosvg.exe"
	}

	Enable = {
		Export-Command "pdftosvg" "./app/pdftosvg.exe" -Symlink
	}
}