@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.13.13"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "2f8028cc342a89b5818edc256d1cd21dd5672fc991861821a07f5f9b4a0c555c"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
