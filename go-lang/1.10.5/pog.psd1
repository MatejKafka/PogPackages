@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.10.5"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "d88a32eb4d1fc3b11253c9daa2ef397c8700f3ba493b41324b152e6cda44d2b4"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
