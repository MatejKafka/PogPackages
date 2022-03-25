@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.16.9"
	_Hash = "ac3793a035054cc62206ce45c3ab006ce24ee99665db724f43b5929766c4c88e"

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
