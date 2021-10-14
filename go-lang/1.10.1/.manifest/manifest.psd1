@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.10.1"
	_Hash = "17f7664131202b469f4264161ff3cd0796e8398249d2b646bbe4990301afc678"
	
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
