@{
	Name = "go-lang"
	Architecture = "x64"
	Version = "1.20.6"

	Install = @{
		Url = {"https://go.dev/dl/go$($this.Version).windows-amd64.zip"}
		Hash = "b67dd7f2b4589701e53c98e348e1b4d9a7c3536dc316941172b2f0b60ae4ce5f"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/packages"

		Export-Command "go" "./.pog/go_wrapper.cmd"
	}
}
