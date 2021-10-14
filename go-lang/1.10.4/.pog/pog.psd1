@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.10.4"
	_Hash = "5499aa98399664df8dc1da5c3aaaed14b3130b79c713b5677a0ee9e93854476c"
	
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
