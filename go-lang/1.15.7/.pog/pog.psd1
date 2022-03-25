@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.15.7"
	_Hash = "6e8f680118d9dfbd7ee61ed2b3d319f278d41de5757b6e30ed190fa9c3ee5767"

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
