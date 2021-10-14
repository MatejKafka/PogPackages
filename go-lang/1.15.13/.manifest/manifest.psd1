@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.15.13"
	_Hash = "d1cf76a11bbd5158715a3e3b6b7f0c623f5472f7c0e654c858913b74b09e7e81"
	
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
