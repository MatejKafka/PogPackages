@{
	Name = 'Stirling-PDF'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = {"https://github.com/Stirling-Tools/Stirling-PDF/releases/download/v$($this.Version)/Stirling-PDF.jar"}
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