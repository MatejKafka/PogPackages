@{
	Name = "Hugo"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"

	Description = "The world's fastest framework for building websites. (extended version)"
	Website = "https://gohugo.io/"
	
	Install = @{
		# Hugo has two editions: standard and extended; we use the extended version, since it's is only ~1 MB larger than the standard one
		Url = {$V = $this.Version; "https://github.com/gohugoio/hugo/releases/download/v${V}/hugo_extended_${V}_windows-amd64.zip"}
		Hash = "{{TEMPLATE:Hash}}"
	}
	
	Enable = {
		Export-Command "hugo" "./app/hugo.exe" -Symlink
	}
}
