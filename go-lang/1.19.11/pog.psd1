@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.19.11"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "25f04babf4ebb51cebca329d3479771b29721433c924c5707f3b0689878d5232"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
