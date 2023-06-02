@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.14.11"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "5f58d41f6f22ce13081cc6118b238a2e540dc6168b3b7e26d786f2ec41a65872"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
