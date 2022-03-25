@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.10.3"
	_Hash = "a3f19d4fc0f4b45836b349503e347e64e31ab830dedac2fc9c390836d4418edb"

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
