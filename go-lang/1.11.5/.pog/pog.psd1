@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.11.5"
	_Hash = "1c734fe614fa052f44694e993f2d06f24a56b6703ee46fdfb2b9bf277819fe40"

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
