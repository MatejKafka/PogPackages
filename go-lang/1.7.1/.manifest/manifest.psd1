@{
	Name = "go-lang"
	Architecture = "x64"
	
	Version = "1.7.1"
	_Hash = "af2b836bb894672cf4c28df32a2ee3ff560e2b463e1ab44bb99833064ba09e5f"
	
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
