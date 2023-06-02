@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.11.9"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "f3f3e3c428131d5be65d79cf8663b3a81b6675e5cf9780c3b0769cfca6824922"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
