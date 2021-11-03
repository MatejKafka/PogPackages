@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.11.8"
	_Hash = "6b9d9f18ace455dcec2e72a0c6740fb23fe5f39433df3522b76ce05dcdcb1808"

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
