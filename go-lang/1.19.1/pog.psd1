@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.19.1"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "b33584c1d93b0e9c783de876b7aa99d3018bdeccd396aeb6d516a74e9d88d55f"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
