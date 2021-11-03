@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.13.7"
	_Hash = "03befd335ee9ddf1d10cae52e84eb5a37408b8e105acc1c29e30bbbbd8143749"

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
