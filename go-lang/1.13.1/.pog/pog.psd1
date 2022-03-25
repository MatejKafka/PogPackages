@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.13.1"
	_Hash = "24cb08d369c1962cccacedc56fd79dc130f623b3b667a316554621ad6ac9b442"

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
