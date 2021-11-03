@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.12.8"
	_Hash = "4352ed90240ddc1b6379adf3210b849b8e89a173ca00616f2beff53df9fef3c8"

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
