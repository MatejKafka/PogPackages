@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.17.12"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "1bdb0e54eda6d917029f8f2d92c0eb8725aea9b9243dc53c09608eb6dbc26c7a"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
