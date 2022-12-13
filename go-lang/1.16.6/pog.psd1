@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.16.6"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "c1132ba4e6263a1712355fb0745bf4f23e1602e1661c20f071e08bdcc5fe8db5"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}