@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.11.9"
	_Hash = "f3f3e3c428131d5be65d79cf8663b3a81b6675e5cf9780c3b0769cfca6824922"
	
	Install = {
		$Url = "https://golang.org/dl/go$($this.Version).windows-amd64.zip"
		Install-FromUrl $Url -ExpectedHash $this._Hash
	}
	
	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"
	
		Export-Command "go" "./.manifest/go_wrapper.cmd" -NoSymlink
	}
}
