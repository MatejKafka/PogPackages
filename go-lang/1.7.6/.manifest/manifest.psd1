@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.7.6"
	_Hash = "3c648f9b89b7e0ed746c211dbf959aa230c8034506dd70c9852bf0f94d06065d"
	
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
