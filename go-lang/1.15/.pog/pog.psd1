@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.15"
	_Hash = "dc491314dff5b87ad50bf1cf56715de8f8c54489be30f3e19239bc2ad1af25e3"

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
