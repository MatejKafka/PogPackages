@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.12.4"
	_Hash = "25b043ebacca2fa2c87bbcd7463be5f34fbd225247c101888f81647fadbdfca0"

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
