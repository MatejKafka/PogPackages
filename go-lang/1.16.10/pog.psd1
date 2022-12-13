@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.16.10"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "787c9afbcd7446874f79bffd20dc4219c3aeff6731bd03f09058bdd546c7eb87"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}