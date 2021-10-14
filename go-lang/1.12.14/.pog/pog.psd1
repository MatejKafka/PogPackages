@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.12.14"
	_Hash = "80f6ca5f5edd87bae7c009340148cd9828a61dd66de5ee7862843b0840afd4f4"
	
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
