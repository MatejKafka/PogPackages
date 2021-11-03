@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.16.8"
	_Hash = "50304f7bdc1ebfe80bc6b64ad567c398cd53e62a75bf77226f2b7ddd1a33d385"

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
