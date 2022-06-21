@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.13"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "7d162b83157d3171961f8e05a55b7da8476244df3fac28a5da1c9e215acfea89"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
