@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.8"
	_Hash = "cb27fe210f3a9d10329d48514895d2a1e3651125a7c3c758f0358a5bfc0e3060"
	
	Install = {
		$Url = "https://golang.org/dl/go$($this.Version).windows-amd64.zip"
		Install-FromUrl $Url -ExpectedHash $this._Hash
	}
	
	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"
	
		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
