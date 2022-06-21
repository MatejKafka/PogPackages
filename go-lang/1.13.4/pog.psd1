@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.13.4"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "ab8b7f7a2a4f7b58720fb2128b32c7471092961ff46a01d9384fb489d8212a0b"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
