@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.9.1"
	_Hash = "8dc72a3881388e4e560c2e45f6be59860b623ad418e7da94e80fee012221cc81"

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
