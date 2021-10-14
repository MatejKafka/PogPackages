@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.11.7"
	_Hash = "7d2a8f2f90f4e989bd3fcb8ab70949a0a3cdb0ed416cd9f61768b4cfc214c09e"
	
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
