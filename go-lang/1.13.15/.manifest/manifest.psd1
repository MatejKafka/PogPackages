@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.13.15"
	_Hash = "26c031d5dc2b39578943dbd34fe5c464ac4ed1c82f8de59f12999d3bf9f83ea1"
	
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
