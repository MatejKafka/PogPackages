@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.8.1"
	_Hash = "bb6f0fbef8b80c382455af8699bfbb7fe89256d4baf06d927feaeceb7342e4ee"

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
