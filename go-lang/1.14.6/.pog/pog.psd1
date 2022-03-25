@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.14.6"
	_Hash = "4495c18579cd11192fc3483d535e567d71c1a5c5b42cec152ad519a3599c3bbb"

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
