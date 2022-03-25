@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.16.15"
	_Hash = "0d6e551206b6d744d1286e62abf46aa2f17fed90f07ec4624a0448d71380407d"

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
