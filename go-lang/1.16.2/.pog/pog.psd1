@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.16.2"
	_Hash = "baa7d69482365930ecc5c0b99e6a5935180988a2e7b49aa8a22dbcd39f4064b7"

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
