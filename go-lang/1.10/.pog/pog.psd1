@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.10"
	_Hash = "210b223031c254a6eb8fa138c3782b23af710a9959d64b551fa81edd762ea167"
	
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
