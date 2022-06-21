@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.15.15"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "7df7bf948dcc8ec0a3902e3301d17cbb5c2ebb01297d686ee2302e41f4ac6e10"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd" -NoSymlink
	}
}
