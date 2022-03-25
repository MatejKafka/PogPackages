@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.12.16"
	_Hash = "d2a570e4872ba2260fb6369e2e9cc217e8f1541388d6f790520eeaf4447fef2f"

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
