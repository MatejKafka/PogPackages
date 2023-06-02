@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.20.3"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "143a2837821c7dbacf7744cbb1a8421c1f48307c6fdfaeffc5f8c2f69e1b7932"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
