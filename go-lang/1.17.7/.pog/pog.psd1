@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.17.7"
	_Hash = "1b648165d62a2f5399f3c42c7e59de9f4aa457212c4ea763e1b650546fac72e2"

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
