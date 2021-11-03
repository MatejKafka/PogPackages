@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.13.14"
	_Hash = "5822f61016ace183bc5f90b58223fa76a5a998b38240846186934954a2e555eb"

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
