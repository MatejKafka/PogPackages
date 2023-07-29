@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.20.5"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "c04a4ed73c3624d5b4c4f62e44a141549cc0bfd83a7492c31ca8b86b3752f077"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
