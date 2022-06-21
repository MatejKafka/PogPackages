@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.15.14"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "88a77bebdd7276d0204f35e371aeaeb619f26b85d2ecf16f65cc713f4d49b9f7"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
