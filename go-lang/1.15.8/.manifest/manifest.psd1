@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.15.8"
	_Hash = "ef05b7141d3c217fb076f0e27249e144296234df96ead8751c0b76784079df97"
	
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
