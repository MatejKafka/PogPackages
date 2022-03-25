@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.15.9"
	_Hash = "daf5c44fb8d6ddd001a0d1eca3d562167101f3d18129c9c935728449036dd79c"

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
