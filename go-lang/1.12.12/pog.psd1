@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.12.12"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "2d030b382514a3c4b76dd0786f810ce50409cebaf311a6b79addc353627263a8"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
