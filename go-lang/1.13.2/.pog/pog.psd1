@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.13.2"
	_Hash = "003c99e778d6f73ba677fec4b66c3bdbbb144b318cfe6ffbe26ed8493b2db9a5"

	Install = {
		$Url = "https://go.dev/dl/go$($this.Version).windows-amd64.zip"
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
