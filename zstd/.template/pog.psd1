@{
	Name = "zstd"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"
	
	Install = @{
		Url = "{{TEMPLATE:Url}}"
		Hash = "{{TEMPLATE:Hash}}"
	}
	
	Enable = {
		Export-Command "zstd" "./app/zstd.exe" -Symlink
	}
}
