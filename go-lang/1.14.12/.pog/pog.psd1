@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.14.12"
	_Hash = "46879d5bdf9c8f74101cce040b61067d31cb37a5e5e11a4189f00d3e06d0784d"
	
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
