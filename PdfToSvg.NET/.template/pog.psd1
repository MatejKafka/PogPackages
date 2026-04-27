@{
	Name = 'PdfToSvg.NET'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Website = 'https://pdftosvg.net'
	Description = 'Fully managed .NET library for converting PDF files to SVG.'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
		NoArchive = $true
		Target = "pdftosvg.exe"
	}

	Enable = {
		Export-Command "pdftosvg" "./app/pdftosvg.exe" -Symlink
	}
}