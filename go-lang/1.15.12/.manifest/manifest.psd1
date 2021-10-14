@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.15.12"
	_Hash = "313e5ebc59b497319c4c3f9560322fcc20f7bc3b4e47494afc3b2d63a42fb2a5"
	
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
