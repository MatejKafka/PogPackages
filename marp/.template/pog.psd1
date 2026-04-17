@{
	Name = 'marp'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		Export-Command "marp" "./app/marp.exe" -Symlink
	}
}
