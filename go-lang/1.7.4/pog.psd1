@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.7.4"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "36739164fed38a6da908813aba48d72fb22fea923de5611a85a81135b7cfceb9"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
