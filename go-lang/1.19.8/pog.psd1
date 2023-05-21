@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.19.8"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "433558e81b8be2983f370bf8e21ac52e76e9e1e50c69b6dc0047f1b6acde97fd"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
