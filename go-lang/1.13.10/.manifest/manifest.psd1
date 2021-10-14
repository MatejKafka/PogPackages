@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.13.10"
	_Hash = "e56ff68ab0d0ebdd9d11e9f3ef4b47fb7bd3a379cb07d444b9f7d77c7009088a"
	
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
