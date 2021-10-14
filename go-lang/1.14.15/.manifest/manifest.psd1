@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.14.15"
	_Hash = "189bc564d537d86f80c70757ee4c29fb1c2c6e8d05bb6de1242a03a96ac850cb"
	
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