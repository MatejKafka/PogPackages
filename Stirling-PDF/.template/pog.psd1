@{
	Name = 'Stirling-PDF'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Website = 'https://stirlingpdf.com'
	Description = @'
Stirling PDF is a powerful, open-source PDF editing platform. Run it as a personal desktop app,
in the browser, or deploy it on your own servers with a private API. Edit, sign, redact, convert,
and automate PDFs without sending documents to external services.
'@

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
		NoArchive = $true
		Target = "./Stirling-PDF.jar"
	}

	Enable = {
		Write-Warning "Stirling-PDF uses an external Java installation."

		New-Directory "./data"

		# FIXME: the java lookup is not nice
		Export-Command "Stirling-PDF" (Get-Command java).Path `
			-Arguments @("-jar", "./app/Stirling-PDF.jar") `
			-WorkingDirectory "./data"

		Export-Shortcut "Stirling-PDF" (Get-Command java).Path `
			-Arguments @("-jar", "./app/Stirling-PDF.jar") `
			-WorkingDirectory "./data"
	}
}