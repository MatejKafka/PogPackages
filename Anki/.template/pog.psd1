@{
	Name = "Anki"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"

	Install = @{
		Url = "{{TEMPLATE:Url}}"
		Hash = "{{TEMPLATE:Hash}}"
		NsisInstaller = $true
	}

	Enable = {
		New-Directory "./data"

		Export-Shortcut Anki "./app/anki.exe" -Arguments @("-b", "./data")
	}
}
