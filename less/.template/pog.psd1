@{
	Name = "less"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"
	
	Install = @{
		Url = "{{TEMPLATE:Url}}"
		Hash = "{{TEMPLATE:Hash}}"
	}
	
	Enable = {
		Export-Command "less" "./app/less.exe" -Symlink
	}
}
