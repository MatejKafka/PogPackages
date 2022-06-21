@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.14.12"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "46879d5bdf9c8f74101cce040b61067d31cb37a5e5e11a4189f00d3e06d0784d"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
