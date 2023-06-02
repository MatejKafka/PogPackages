@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.18.8"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "980788761e75ed33ffc4f2a7a3ff07cd90949bd023eb1a8d855ef0b5de9cbcba"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
