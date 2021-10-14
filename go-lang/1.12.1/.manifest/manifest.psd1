@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.12.1"
	_Hash = "2f4849b512fffb2cf2028608aa066cc1b79e730fd146c7b89015797162f08ec5"
	
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
