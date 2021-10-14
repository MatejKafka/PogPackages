@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.11.12"
	_Hash = "a86e41e06d39f68ea8fa6a7765ce529abe3ec5037ba3a3bff2e6d25455a4fa34"
	
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
