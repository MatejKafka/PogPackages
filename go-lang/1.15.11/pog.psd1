@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.15.11"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "56f63de17cd739287de6d9f3cfdad3b781ad3e4a18aae20ece994ee97c1819fd"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
