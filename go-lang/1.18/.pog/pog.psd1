@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.18"
	_Hash = "65c5c0c709a7ca1b357091b10b795b439d8b50e579d3893edab4c7e9b384f435"

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