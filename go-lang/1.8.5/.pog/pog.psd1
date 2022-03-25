@{
	Name = "go-lang"
	Architecture = "x64"

	Version = "1.8.5"
	_Hash = "137827cabff27cc36cbe13018f629a6418c2a6af85adde1b1bfb8d000c9fc1ae"

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
