@{
	Name = 'git-delta'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		Export-Command "delta" "./app/delta.exe" -VcRedist
	}
}
