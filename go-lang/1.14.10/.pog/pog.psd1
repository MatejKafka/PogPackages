@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.14.10"
	_Hash = "ca216afc0906f113d1c5b3498bb0015204e7ce2fd14091f5a99aae82bfb16af3"
	
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
