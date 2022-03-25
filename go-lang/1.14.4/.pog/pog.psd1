@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.14.4"
	_Hash = "e04f591219b18e7cabe73eb79c90405b5c7a5baee61377670d7a48429c5c978d"

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
