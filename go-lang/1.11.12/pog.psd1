@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.11.12"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "a86e41e06d39f68ea8fa6a7765ce529abe3ec5037ba3a3bff2e6d25455a4fa34"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
