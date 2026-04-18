@{
	Name = 'GitHub CLI'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		New-Directory "./config"
		New-Directory "./data"

		Export-Command "gh" "./app/bin/gh.exe" -Environment @{
			GH_CONFIG_DIR = "./config"
			XDG_DATA_HOME = "./data"
			XDG_STATE_HOME = "./data"
		}
	}
}
