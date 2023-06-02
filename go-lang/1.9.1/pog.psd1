@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.9.1"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "8dc72a3881388e4e560c2e45f6be59860b623ad418e7da94e80fee012221cc81"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
