@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.9"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "874b144b994643cff1d3f5875369d65c01c216bb23b8edddf608facc43966c8b"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
