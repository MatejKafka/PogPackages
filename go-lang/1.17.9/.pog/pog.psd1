@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.17.9"
	_Hash = "82752c3313cc6c1e1b5d73743a3ec569b09a14246fc2cb0824cf30f9f42a6005"

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