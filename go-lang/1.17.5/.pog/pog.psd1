@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.17.5"
	_Hash = "671faf99cd5d81cd7e40936c0a94363c64d654faa0148d2af4bbc262555620b9"

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
