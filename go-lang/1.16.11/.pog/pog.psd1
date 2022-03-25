@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.16.11"
	_Hash = "3a172493e530b772ee061202409a7f36e17c4b3ae5a13d4b1d71427cce80ae39"

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