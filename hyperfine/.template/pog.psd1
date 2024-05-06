@{
	Name = "hyperfine"
	Architecture = "x64"
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
	}
	
	Enable = {
		Export-Command "hyperfine" "./app/hyperfine.exe" -VcRedist
	}
}
