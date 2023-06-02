@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.15.1"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "8e3e1e35e03af28d974ad872883884a4c544f6bdb2e2edb1126d6b528d017696"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
