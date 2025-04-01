@{
	Name = 'Azure CLI'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		New-Directory "./config"

		Export-Command "az" "./app/bin/az.cmd" -Environment @{
			AZURE_CONFIG_DIR = "./config"
		}
	}
}