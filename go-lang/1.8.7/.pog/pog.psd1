@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.8.7"
	_Hash = "633a28e72b95e8372e5416dd4723881d7a7109be08daf097ebce2679939f6a82"
	
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
