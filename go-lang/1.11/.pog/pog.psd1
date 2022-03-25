@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.11"
	_Hash = "29f9291270f0b303d0b270f993972ead215b1bad3cc674a0b8a09699d978aeb4"

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
