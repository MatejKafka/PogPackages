@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.13.4"
	_Hash = "ab8b7f7a2a4f7b58720fb2128b32c7471092961ff46a01d9384fb489d8212a0b"

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
