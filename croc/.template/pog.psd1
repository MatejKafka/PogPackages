@{
	Name = "croc"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"

	Website = "https://github.com/schollz/croc"
	Description = "Easily and securely send things from one computer to another."

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = "{{TEMPLATE:Hash}}"
	}

	Enable = {
		New-Directory "./config"

		Export-Command "croc" "./app/croc.exe" -Environment @{CROC_CONFIG_DIR = "./config"}
	}
}
