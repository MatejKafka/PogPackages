@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.16.3"
	_Hash = "a4400345135b36cb7942e52bbaf978b66814738b855eeff8de879a09fd99de7f"

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