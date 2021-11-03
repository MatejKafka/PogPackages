@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.15.11"
	_Hash = "56f63de17cd739287de6d9f3cfdad3b781ad3e4a18aae20ece994ee97c1819fd"

	Install = {
		$Url = "https://golang.org/dl/go$($this.Version).windows-amd64.zip"
		Install-FromUrl $Url -ExpectedHash $this._Hash
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "$ManifestRoot/go_wrapper.cmd" -NoSymlink
	}
}
