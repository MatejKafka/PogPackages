@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.8.4"
	_Hash = "2ddfea037fd5e2eeb0cb854c095f6e44aaec27e8bbf76dca9a11a88e3a49bbf7"

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
