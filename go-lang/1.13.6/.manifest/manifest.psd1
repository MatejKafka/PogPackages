@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.13.6"
	_Hash = "66eae07e03310b67d279701028ba8dc6948cd0acdc6fbe21c22bfa9a2bc48884"
	
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
