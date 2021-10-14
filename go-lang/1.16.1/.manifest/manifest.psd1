@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.16.1"
	_Hash = "5349a85c190d953e9d59570cad6798c57b18e0bd93794927f25a89e695a5b5be"
	
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
