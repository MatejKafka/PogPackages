@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.17.8"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "85ccf2608dca6ea9a46b6538c9e75e7cf2aebdf502379843b248e26b8bb110be"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
