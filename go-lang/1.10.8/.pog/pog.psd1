@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.10.8"
	_Hash = "ab63b55c349f75cce4b93aefa9b52828f50ebafb302da5057db0e686d7873d7a"
	
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
