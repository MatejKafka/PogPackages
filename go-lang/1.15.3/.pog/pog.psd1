@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.15.3"
	_Hash = "1d579d0e980763f60bf43afb7c3783caf63433a485731ef4d2e262878d634b3f"

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
