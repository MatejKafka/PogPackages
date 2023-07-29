@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.19.10"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "c749a054a5da17202113455040484893c29ebe5ab71fa89f60cdfb4561dcce8c"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
