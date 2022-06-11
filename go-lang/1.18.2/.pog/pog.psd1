@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.18.2"
	_Hash = "41fc44109c39a98e0c3672989ac5ad205cbb5768067e099dc4fb2b75cba922cf"

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
