@{
	Name = "Zadig"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"

	Description = "USB driver installation made easy"
	Website = "https://zadig.akeo.ie/"

	Install = @{
		Url = "{{TEMPLATE:Url}}"
		Hash = "{{TEMPLATE:Hash}}"
		NoArchive = $true
		Target = "zadig.exe"
	}

	Enable = {
		Assert-Directory "./config"
		Set-SymlinkedPath "./app/zadig.ini" "./config/zadig.ini" File

		Export-Shortcut "Zadig" "./app/zadig.exe"
	}
}
