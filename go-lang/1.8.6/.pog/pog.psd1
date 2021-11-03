@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.8.6"
	_Hash = "7b6dce9e0119ab3db33ebedaa502a3c6624f2f61edec2d292d4aef0827c286d3"

	Install = {
		$Url = "https://golang.org/dl/go$($this.Version).windows-amd64.zip"
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
