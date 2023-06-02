@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.17.13"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "6cea8e199c8034995f3a691ef4564e0cc6645ee1649d7ef268a836387f1a5dfa"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
