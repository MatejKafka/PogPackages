@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.6.2"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "4367a147b6351c4975732375a21a098c90d26ca0e948245f602295aab389e0d0"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
