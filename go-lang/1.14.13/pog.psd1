@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.14.13"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "18c5597d7648ce3872f4a0a7bc73a70c01b56b77feac5e5f80b2ecba0d231473"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
