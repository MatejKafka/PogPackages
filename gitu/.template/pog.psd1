@{
	Name = 'gitu'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = {$V = $this.Version; "https://github.com/altsem/gitu/releases/download/v${V}/gitu-v${V}-x86_64-pc-windows-msvc.zip"}
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