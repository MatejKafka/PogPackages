@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.18.5"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "73753620602d4b4469770040c53db55e5dd6af2ad07ecc18f71f164c3224eaad"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
