@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.13"
	_Hash = "7d162b83157d3171961f8e05a55b7da8476244df3fac28a5da1c9e215acfea89"

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
