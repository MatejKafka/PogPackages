@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.9.2"
	_Hash = "682ec3626a9c45b657c2456e35cadad119057408d37f334c6c24d88389c2164c"
	
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
