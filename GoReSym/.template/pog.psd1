@{
	Name = 'GoReSym'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Website = 'https://github.com/mandiant/GoReSym'
	Description = 'Go symbol recovery tool.'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		Export-Command "GoReSym" "./app/GoReSym.exe" -Symlink
	}
}