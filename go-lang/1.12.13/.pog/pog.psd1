@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.12.13"
	_Hash = "c441a298e8b510d3cdabfd361885cd6762e33eaceb27cbb0eabe6757f9d1f07d"

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
