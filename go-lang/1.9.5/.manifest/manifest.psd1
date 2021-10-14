@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.9.5"
	_Hash = "6c3ef0e069c0edb0b5e8575f0efca806f69354a7b808f9846b89046f46a260c2"
	
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
