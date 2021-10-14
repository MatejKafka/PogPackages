@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.10.6"
	_Hash = "fc57f16c23b7fb41b664f549ff2ed6cca340555e374c5ff52fa296cd3f228f32"
	
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
