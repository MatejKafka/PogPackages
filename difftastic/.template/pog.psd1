@{
	Name = 'difftastic'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'
	
	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
	}
	
	Enable = {
		Export-Command "difft" "./app/difft.exe" -VcRedist
	}
}
