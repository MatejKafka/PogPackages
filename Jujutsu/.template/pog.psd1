@{
	Name = 'Jujutsu'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Description = "A Git-compatible DVCS that is both simple and powerful"

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		New-File "./config/jjconfig.toml"

		Export-Command "jj" "./app/jj.exe" -Environment @{JJ_CONFIG = "./config/jjconfig.toml"} -VcRedist
	}
}
