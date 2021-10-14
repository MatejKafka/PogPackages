@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.11.6"
	_Hash = "a91a1efb00028b222445f4bcb6c84548bbd74962e53c87b68f0bce65de29c1ae"
	
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
