@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.12"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "880ced1aecef08b3471a84381b6c7e2c0e846b81dd97ecb629b534d941f282bd"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
