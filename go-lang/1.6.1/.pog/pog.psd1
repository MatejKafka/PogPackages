@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.6.1"
	_Hash = "1505afbcc5f71598c6ffd2a56ad550e4e8728c05649e9085f725e38d6b5a0fb8"
	
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
