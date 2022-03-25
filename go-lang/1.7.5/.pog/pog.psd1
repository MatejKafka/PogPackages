@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.7.5"
	_Hash = "01eb518cb5a12edd6cf7380ec17ebedee755e3ce7e5362febeebb9e70e45fcaa"

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
