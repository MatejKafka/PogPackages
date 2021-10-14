@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.14.8"
	_Hash = "f0fb99ef42f4b5cc021e48c442eb4c71b2ee7790ed1c3c7a2c5315248536fe98"
	
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
