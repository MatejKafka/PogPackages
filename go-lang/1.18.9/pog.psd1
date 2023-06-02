@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.18.9"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "7f31bb0804f2985f4d506aba3b56edd1435f3f66e331c12c91a631f66bf1a767"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
