@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.14.11"
	_Hash = "5f58d41f6f22ce13081cc6118b238a2e540dc6168b3b7e26d786f2ec41a65872"
	
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
