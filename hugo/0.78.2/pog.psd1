@{
	Name = "hugo"
	Architecture = "x64"
	Description = "A Fast and Flexible Static Site Generator built with love by bep, spf13 and friends in Go."
	Version = "0.78.2"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/gohugoio/hugo/releases/download/v${V}/hugo_${V}_Windows-64bit.zip"}
		Hash = "ad5dd832d781fac385abd9956b55d2e342a769e6020d49cd372838ca5c39739c"
	}
	
	Enable = {
		Export-Command "hugo" "./app/hugo.exe" -Symlink
	}
}
