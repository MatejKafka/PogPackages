@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.19.4"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "ada490e188bfb57c7388da7c5eba7565390992b6496204d30e710d37755956b0"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
