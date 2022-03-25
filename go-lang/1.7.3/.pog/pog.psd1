@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.7.3"
	_Hash = "9fe41313b97e2a6a703f5ae22938c7d9ac4336a128b522376c224ba97e8c7f01"

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
