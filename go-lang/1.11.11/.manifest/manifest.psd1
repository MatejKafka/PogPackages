@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.11.11"
	_Hash = "38018a1a0fa341687cee2f71c0e7578f852bbf017ad48907cda6cc28d1b84140"
	
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
