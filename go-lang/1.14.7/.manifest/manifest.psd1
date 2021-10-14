@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.14.7"
	_Hash = "ddf35c01f444f5698dee7b265c172abe29dd7138bef4415e6b60bf322ddcffa5"
	
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
