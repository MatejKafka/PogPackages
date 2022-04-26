@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.18.1"
	_Hash = "c30bc3f1f7314a953fe208bd9cd5e24bd9403392a6c556ced3677f9f70f71fe1"

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
