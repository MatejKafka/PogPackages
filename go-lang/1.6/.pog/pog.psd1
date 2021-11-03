@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.6"
	_Hash = "1be06afa469666d636a00928755c4bcd6403a01f5761946b2b13b8a664f86bac"

	Install = {
		$Url = "https://golang.org/dl/go$($this.Version).windows-amd64.zip"
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
