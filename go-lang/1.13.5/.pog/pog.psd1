@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.13.5"
	_Hash = "027275e04d795fbadc898ba7a50ed0ab2161ff4c5e613c94dbb066b2ca24ec11"

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
