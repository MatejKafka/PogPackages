@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.16.13"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "76c938058444093bb6d95c5ee05db07c2b970f07d450d3b6d3cdea60edeb2765"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
