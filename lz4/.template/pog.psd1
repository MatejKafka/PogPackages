@{
	Name = 'lz4'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		Export-Command "lz4" "./app/lz4.exe" -Symlink
	}
}