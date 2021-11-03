@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.17"
	_Hash = "2a18bd65583e221be8b9b7c2fbe3696c40f6e27c2df689bbdcc939d49651d151"

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
