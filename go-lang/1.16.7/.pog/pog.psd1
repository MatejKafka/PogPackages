@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.16.7"
	_Hash = "56b3a9024268f226f679c3a8ffb21f4214a75f84050b2c395b362ae2cc8e53e9"

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
