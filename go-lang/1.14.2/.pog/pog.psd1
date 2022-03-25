@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.14.2"
	_Hash = "1b5a60b3bbaa81106d5ee03499b5734ec093c6a255abf9a6a067f0f497a57916"

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
