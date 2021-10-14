@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.14.13"
	_Hash = "18c5597d7648ce3872f4a0a7bc73a70c01b56b77feac5e5f80b2ecba0d231473"
	
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
