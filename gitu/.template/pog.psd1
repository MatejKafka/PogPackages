@{
	Name = 'gitu'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Website = 'https://github.com/altsem/gitu'
	Description = 'A TUI Git client inspired by Magit.'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		# gitu uses the `etcetera` crate for config paths
		New-File "./config/gitu/config.toml" {
			"# for available config keys, refer to https://github.com/altsem/gitu/blob/master/src/default_config.toml`n"
		}

		Export-Command "gitu" "./app/gitu.exe" -Environment @{APPDATA = "./config"} -VcRedist
	}
}