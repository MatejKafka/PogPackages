@{
	Name = 'bottom'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		New-Directory "./config"

		# using -C instead of --config_location, because apparently it used to be --config in older versions
		Export-Command "btm" "./app/btm.exe" -Arguments "-C", "./config/bottom.toml"
	}
}