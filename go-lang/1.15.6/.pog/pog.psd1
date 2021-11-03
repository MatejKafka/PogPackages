@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.15.6"
	_Hash = "b7b3808bb072c2bab73175009187fd5a7f20ffe0a31739937003a14c5c4d9006"

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
