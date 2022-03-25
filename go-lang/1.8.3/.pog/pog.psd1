@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.8.3"
	_Hash = "de026caef4c5b4a74f359737dcb2d14c67ca45c45093755d3b0d2e0ee3aafd96"

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
