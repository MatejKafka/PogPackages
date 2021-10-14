@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.12.11"
	_Hash = "0b0c8dbcb9efa5f32c1249fc9c59ce0eb07d7a69b50ba48f0a713d0527231f2f"
	
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
