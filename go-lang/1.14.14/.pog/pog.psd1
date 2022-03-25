@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.14.14"
	_Hash = "88e6be798902d802481b83015e23f6e587cbe0e58766dfa7959d1032865f6bab"

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
