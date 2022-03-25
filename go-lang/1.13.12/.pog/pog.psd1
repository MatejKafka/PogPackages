@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.13.12"
	_Hash = "43c4b434f965efa9015c47a1f65858f62ab425fba9fa36a48ed40d1805dd0479"

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
