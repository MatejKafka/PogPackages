@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.12.12"
	_Hash = "2d030b382514a3c4b76dd0786f810ce50409cebaf311a6b79addc353627263a8"
	
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
