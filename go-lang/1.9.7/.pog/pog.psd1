@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.9.7"
	_Hash = "8db4b21916a3bc79f48d0611202ee5814c82f671b36d5d2efcb446879456cd28"

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
