@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.19.6"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "8d84af29e46c38b1eec77f9310310517c9e394ac7489e1c7329a94b443b0388d"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
