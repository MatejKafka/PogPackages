@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.13.11"
	_Hash = "e6d1805cc70d042133b94a598c7e666b166ee804d541ec35e63ca8eb3053036b"

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