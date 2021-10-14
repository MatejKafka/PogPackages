@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.10.7"
	_Hash = "791e2d5a409932157ac87f4da7fa22d5e5468b784d5933121e4a747d89639e15"
	
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