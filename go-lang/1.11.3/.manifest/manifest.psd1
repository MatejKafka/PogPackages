@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.11.3"
	_Hash = "bc168207115eb0686e226ed3708337b161946c1acb0437603e1221e94f2e1f0f"
	
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
