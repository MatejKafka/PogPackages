@{
	Name = 'aria2'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = "{{TEMPLATE:Url}}"
		Hash = "{{TEMPLATE:Hash}}"
	}

	Enable = {
		New-File "./config/aria2.conf"

		Export-Command "aria2c" "./app/aria2c.exe" -Arguments @("--conf-path=" + (Resolve-Path "./config/aria2.conf"))
	}
}
