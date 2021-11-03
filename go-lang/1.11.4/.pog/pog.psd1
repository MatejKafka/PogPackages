@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.11.4"
	_Hash = "eeb20e21702f2b9469d9381df5de85e2f731b64a1f54effe196d0f7d0227fe14"

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
