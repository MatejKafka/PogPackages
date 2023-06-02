@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.15.6"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "b7b3808bb072c2bab73175009187fd5a7f20ffe0a31739937003a14c5c4d9006"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
