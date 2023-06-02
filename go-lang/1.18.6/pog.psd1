@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.18.6"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "480b7212ab1d152d5e3fc382ac34d3dd26bf637ae4537c35b4b554ede8a36b47"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
