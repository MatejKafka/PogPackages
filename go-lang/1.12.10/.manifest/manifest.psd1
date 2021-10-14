@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.12.10"
	_Hash = "38ea3422a4b7e60a8959b1d6b570ecc28d8c39faefac0f79d1e7104ce3204967"
	
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
