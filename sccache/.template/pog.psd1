@{
	Name = 'sccache'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		New-File "./config/config.toml"
		New-Directory "./cache"

		Export-Command "sccache" "./app/sccache.exe" -Environment @{
			SCCACHE_CONF = "./config/config.toml"
			SCCACHE_DIR = "./cache"
		}
	}
}