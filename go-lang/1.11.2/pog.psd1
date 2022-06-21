@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.11.2"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "086c59df0dce54d88f30edd50160393deceb27e73b8d6b46b9ee3f88b0c02e28"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
