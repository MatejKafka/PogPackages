@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.9.3"
	_Hash = "4eee59bb5b70abc357aebd0c54f75e46322eb8b58bbdabc026fdd35834d65e1e"
	
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
