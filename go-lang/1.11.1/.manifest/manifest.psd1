@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.11.1"
	_Hash = "230a08d4260ded9d769f072512a49bffe8bfaff8323e839c2db7cf7c9c788130"
	
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