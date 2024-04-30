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
		Write-Warning "Zadig updater writes to 'HKEY_CURRENT_USER\SOFTWARE\Akeo Consulting\Zadig'."

		New-Directory "./config"
		New-Symlink "./app/zadig.ini" "./config/zadig.ini" File

		Export-Shortcut "Zadig" "./app/zadig.exe"
	}
}
