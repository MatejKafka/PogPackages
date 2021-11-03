@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.9.4"
	_Hash = "880e011ac6f4a509308a62ec6d963dd9d561d0cdc705e93d81c750d7f1c696f4"

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
