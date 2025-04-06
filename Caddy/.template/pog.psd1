@{
	Name = 'Caddy'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Website = "https://caddyserver.com/"
	Description = "Caddy is a powerful, enterprise-ready, open source web server with automatic HTTPS written in Go."

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		New-Directory "./config/caddy"
		New-Directory "./data/caddy"

		# https://github.com/caddyserver/caddy/blob/5a6b2f8d1d4633622b551357f3cc9d27ec669d02/storage.go#L86
		# for verification, run `caddy environ`
		Export-Command "caddy" "./app/caddy.exe" -Environment @{
			XDG_DATA_HOME="./data"
			XDG_CONFIG_HOME="./config"
		}
	}
}