@{
	Name = "pandoc"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"
	
	Install = @{
		Url = "{{TEMPLATE:Url}}"
		Hash = "{{TEMPLATE:Hash}}"
	}
	
	Enable = {
		Export-Command "pandoc" "./app/pandoc.exe" -Symlink
	}
}
