@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.13.9"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "cf066aabdf4d83c251aaace14b57a35aafffd1fa67d54d907f27fb31e470a135"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}