@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.14.1"
	_Hash = "4bcc3bbdeba4b298120b4ea78e22b8c0fe93478b47dd7b84d70d97d2b264a0a6"
	
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
