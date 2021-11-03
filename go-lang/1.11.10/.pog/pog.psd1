@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.11.10"
	_Hash = "e0354b5cef18dbf5867fff022ed4264c441df504f3cb86c90d8b987eca336f78"

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
