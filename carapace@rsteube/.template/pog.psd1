@{
	Name = 'carapace@rsteube'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Description = "Multi-shell multi-command argument completer."
	Website = "https://carapace.sh/"

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		New-Directory "./data"
		New-Directory "./cache"

		Export-Command "carapace" "./app/carapace.exe" -Environment @{
			APPDATA = "./data"
			LOCALAPPDATA = "./cache"
		}
	}
}
