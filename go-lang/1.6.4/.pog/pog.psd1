@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.6.4"
	_Hash = "4fc871ac03f5ca5978ad2ae860192e6a39dc2b1286afbe86f4947faab84ab231"

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
